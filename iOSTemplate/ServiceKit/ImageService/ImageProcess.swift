//
//  ImageProcess.swift
//  ServiceKit
//

import UIKit
import CoreGraphics

struct ImageProcess {

  /**
   FitMode drives the resizing process to determine what to do with an image to
   make it fit the given size bounds.

   - Clip:  Resizes the image to fit within the width and height boundaries without cropping or scaling the image.

   - Crop:  Resizes the image to fill the width and height boundaries and crops any excess image data.

   - Scale: Scales the image to fit the constraining dimensions exactly.
   */
  public enum FitMode {
    /**
     Resizes the image to fit within the width and height boundaries without cropping or scaling the image.
     The resulting image is assured to match one of the constraining dimensions, while
     the other dimension is altered to maintain the same aspect ratio of the input image.
     */
    case clip

    /**
     Resizes the image to fill the width and height boundaries and crops any excess image data.
     The resulting image will match the width and height constraints without scaling the image.
     */
    case crop

    /**
     Scales the image to fit the constraining dimensions exactly.
     */
    case scale
  }
  /**
   Resize an image to the specified size. Depending on what fitMode is supplied, the image
   may be clipped, cropped or scaled. @see documentation on FitMode.

   - parameter image:   Image to Resize
   - parameter size:    Size to resize the image to
   - parameter fitMode: How to handle the image resizing process

   - returns: Resized image
   */
  static func resizeImage(_ image: UIImage, size: CGSize, fitMode: FitMode = .clip) -> UIImage {

    guard let imgRef = Util.CGImageWithCorrectOrientation(image) else { return image }
    let originalWidth  = CGFloat(imgRef.width)
    let originalHeight = CGFloat(imgRef.height)
    let widthRatio = size.width / originalWidth
    let heightRatio = size.height / originalHeight

    let scaleRatio = widthRatio > heightRatio ? widthRatio : heightRatio

    let resizedImageBounds = CGRect(x: 0, y: 0, width: round(originalWidth * scaleRatio), height: round(originalHeight * scaleRatio))
    let resizedImage = Util.drawImageInBounds(image, bounds: resizedImageBounds)

    switch (fitMode) {
    case .clip:
      return resizedImage
    case .crop:
      let croppedRect = CGRect(x: (resizedImage.size.width - size.width) / 2,
                               y: (resizedImage.size.height - size.height) / 2,
                               width: size.width, height: size.height)
      return Util.croppedImageWithRect(resizedImage, rect: croppedRect)
    case .scale:
      return Util.drawImageInBounds(resizedImage, bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
  }
  struct Util {

    /**
     Get the CGImage of the image with the orientation fixed up based on EXF data.
     This helps to normalise input images to always be the correct orientation when performing
     other core graphics tasks on the image.

     - parameter image: Image to create CGImageRef for

     - returns: CGImageRef with rotated/transformed image context
     */
    static func CGImageWithCorrectOrientation(_ image : UIImage) -> CGImage? {
      guard let cgImage = image.cgImage else { return nil }
      if (image.imageOrientation == .up) {
        return cgImage
      }

      var transform = CGAffineTransform.identity

      switch (image.imageOrientation) {
      case .right, .rightMirrored:
        transform = transform.translatedBy(x: 0, y: image.size.height)
        transform = transform.rotated(by: CGFloat(-1.0 * Double.pi/2))
      case .left, .leftMirrored:
        transform = transform.translatedBy(x: image.size.width, y: 0)
        transform = transform.rotated(by: CGFloat(Double.pi/2))
      case .down, .downMirrored:
        transform = transform.translatedBy(x: image.size.width, y: image.size.height)
        transform = transform.rotated(by: CGFloat(Double.pi))
      default: break
      }

      switch (image.imageOrientation) {
      case .rightMirrored, .leftMirrored:
        transform = transform.translatedBy(x: image.size.height, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
      case .downMirrored, .upMirrored:
        transform = transform.translatedBy(x: image.size.width, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
      default: break
      }

      let contextWidth : Int
      let contextHeight : Int

      switch (image.imageOrientation) {
      case .left, .leftMirrored,
           .right, .rightMirrored:
        contextWidth = cgImage.height
        contextHeight = cgImage.width
      default:
        contextWidth = cgImage.width
        contextHeight = cgImage.height
      }
      if let colorSpace = cgImage.colorSpace,
        let context = CGContext(data: nil, width: contextWidth, height: contextHeight,
                                bitsPerComponent: cgImage.bitsPerComponent,
                                bytesPerRow: cgImage.bytesPerRow,
                                space: colorSpace,
                                bitmapInfo: cgImage.bitmapInfo.rawValue) {
        context.concatenate(transform)
        context.draw(cgImage, in: CGRect(x: 0, y: 0, width: CGFloat(contextWidth), height: CGFloat(contextHeight)))
        return context.makeImage()
      }
      return cgImage
    }

    /**
     Draw the image within the given bounds (i.e. resizes)

     - parameter image:  Image to draw within the given bounds
     - parameter bounds: Bounds to draw the image within

     - returns: Resized image within bounds
     */
    static func drawImageInBounds(_ image: UIImage, bounds : CGRect) -> UIImage {
      return drawImageWithClosure(size: bounds.size, image: image) { (_, _) in
        image.draw(in: bounds)
      }
    }

    /**
     Crop the image within the given rect (i.e. resizes and crops)

     - parameter image: Image to clip within the given rect bounds
     - parameter rect:  Bounds to draw the image within

     - returns: Resized and cropped image
     */
    static func croppedImageWithRect(_ image: UIImage, rect: CGRect) -> UIImage {
      return drawImageWithClosure(size: rect.size, image: image) { (size, context) in
        let drawRect = CGRect(x: -rect.origin.x, y: -rect.origin.y, width: image.size.width, height: image.size.height)
        context.clip(to: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        image.draw(in: drawRect)
      }
    }

    /**
     Closure wrapper around image context - setting up, ending and grabbing the image from the context.

     - parameter size:    Size of the graphics context to create
     - parameter closure: Closure of magic to run in a new context

     - returns: Image pulled from the end of the closure
     */
    static func drawImageWithClosure(size: CGSize, image: UIImage, closure: (_ size: CGSize, _ context: CGContext) -> Void) -> UIImage {
      UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
      if let context = UIGraphicsGetCurrentContext() {
        closure(size, context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img ?? image
      }
      UIGraphicsEndImageContext()
      return image
    }
  }
}
