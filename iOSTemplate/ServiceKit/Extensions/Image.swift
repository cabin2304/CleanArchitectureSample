//
//  Image.swift
//  ServiceKit
//

import UIKit
import CoreGraphics
import AVFoundation
import Kingfisher
import Photos
import MobileCoreServices
import ImageIO

extension UIImage {
  
  public func scaled(_ newSize: CGSize) -> UIImage {
    guard size != newSize else {
      return self
    }
    
    let ratio = max(newSize.width / size.width, newSize.height / size.height)
    let width = size.width * ratio
    let height = size.height * ratio
    
    let scaledRect = CGRect(
      x: (newSize.width - width) / 2.0,
      y: (newSize.height - height) / 2.0,
      width: width, height: height)
    
    UIGraphicsBeginImageContextWithOptions(scaledRect.size, false, 0.0)
    defer { UIGraphicsEndImageContext() }
    
    draw(in: scaledRect)
    
    return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
  }
  
  public enum JPEGQuality: CGFloat {
    case lowest  = 0.05
    case low     = 0.25
    case medium  = 0.5
    case high    = 0.75
    case highest = 1
  }
  
  /// Returns the data for the specified image in JPEG format.
  /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
  /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
  public func jpeg(_ quality: JPEGQuality = .highest) -> Data {
    return autoreleasepool(invoking: { () -> Data in
      let data = NSMutableData()
      let options: NSDictionary = [kCGImagePropertyOrientation: imageOrientation,
                                   kCGImagePropertyHasAlpha: true,
                                   kCGImageDestinationLossyCompressionQuality: quality.rawValue]
      if let cgImage = cgImage, let imgDest = CGImageDestinationCreateWithData(data as CFMutableData, kUTTypeJPEG, 1, nil) {
        CGImageDestinationAddImage(imgDest, cgImage, options)
        CGImageDestinationFinalize(imgDest)
        return data as Data
      }
      return self.jpegData(compressionQuality: quality.rawValue) ?? Data()
    })
  }
  
  public func gifData() -> Data? {
    return self.kf.gifRepresentation()
  }
  
  /// Create a new image from itself by clipping corners and drawing the mask into original image as well as resize the image to an expected size.
  public func modifyImage(size: CGSize, radius: CGFloat = 0, corners: UIRectCorner? = nil) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    
    let imgRect = CGRect(origin: .zero, size: size)
    if let corners = corners {
      UIBezierPath(roundedRect: imgRect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).addClip()
    } else if radius != 0 {
      UIBezierPath(roundedRect: imgRect, cornerRadius: radius).addClip()
    }
    self.draw(in: imgRect)
    
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return result
  }
  
  public func cropToBounds(size: CGSize) -> UIImage? {
    
    guard let cgImage = self.cgImage else {
      return nil
    }
    let contextImage = UIImage(cgImage: cgImage)
    let contextSize: CGSize = contextImage.size
    
    var posX: CGFloat = 0.0
    var posY: CGFloat = 0.0
    var cgwidth: CGFloat = size.width
    var cgheight: CGFloat = size.height
    
    // See what size is longer and create the center off of that
    if contextSize.width > contextSize.height {
      posX = ((contextSize.width - contextSize.height) / 2)
      posY = 0
      cgwidth = contextSize.height
      cgheight = contextSize.height
    } else {
      posX = 0
      posY = ((contextSize.height - contextSize.width) / 2)
      cgwidth = contextSize.width
      cgheight = contextSize.width
    }
    
    let rect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
    
    // Create bitmap image from context using the rect
    if let imageRef = cgImage.cropping(to: rect) {
      // Create a new image based on the imageRef and rotate back to the original orientation
      return UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
    }
    return nil
  }
  
  public func cropImageCameraImageBy(size: CGSize) -> UIImage {
    guard let cgImage = self.cgImage else {
      return self
    }
    let contextImage = UIImage(cgImage: cgImage)
    let contextSize: CGSize = contextImage.size
    
    let cgwidth: CGFloat = size.width
    let cgheight: CGFloat = size.height
    
    let imageRatio = contextSize.width / contextSize.height
    let imageSizeRatio = cgwidth / cgheight
    
    if imageRatio != imageSizeRatio {
      let width = contextSize.height * imageSizeRatio
      let topLeftX = (contextSize.width - width) * 0.5
      let rect = CGRect(x: topLeftX, y: 0, width: width, height: contextSize.height)
      // Create bitmap image from context using the rect
      guard let imageRef = cgImage.cropping(to: rect) else {
        return self
      }
      return UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
    }
    
    return self
  }
  
  public func cropImageBy(size: CGSize, keepSize: Bool = false) -> UIImage {
    var sizeCrop = size
    if !keepSize {
      let maxHeightSize = size.width == size.height ? size.height: size.width * self.size.height / self.size.width
      let maxWidthSize = size.width
      sizeCrop = CGSize(width: maxWidthSize, height: maxHeightSize)
    }
    return ImageProcess.resizeImage(self, size: sizeCrop)
  }
  
  /// This resolves a problem that the image which have been taken by custom Camera sometimes doesn't get proper bounds
  ///
  /// - Parameter previewLayer: customized camera layer
  /// - Returns: if the cropping gets completed with error, a proper image will go out. Otherwise, nil value gets returned
  public func cropCameraImage(previewLayer: AVCaptureVideoPreviewLayer) -> UIImage? {
    
    let previewImageLayerBounds = previewLayer.bounds
    
    let originalWidth = size.width
    let originalHeight = size.height
    
    let A = previewImageLayerBounds.origin
    let B = CGPoint(x: previewImageLayerBounds.size.width, y: previewImageLayerBounds.origin.y)
    let D = CGPoint(x: previewImageLayerBounds.size.width, y: previewImageLayerBounds.size.height)
    
    let a = previewLayer.captureDevicePointConverted(fromLayerPoint: A)
    let b = previewLayer.captureDevicePointConverted(fromLayerPoint: B)
    let d = previewLayer.captureDevicePointConverted(fromLayerPoint: D)
    
    let posX = floor(b.x * originalHeight)
    let posY = floor(b.y * originalWidth)
    
    let width: CGFloat = d.x * originalHeight - b.x * originalHeight
    let height: CGFloat = a.y * originalWidth - b.y * originalWidth
    
    let cropRect = CGRect(x: posX, y: posY, width: width, height: height)
    
    if let cgImage = cgImage, let imageRef = cgImage.cropping(to: cropRect) {
      let image = UIImage(cgImage: imageRef, scale: scale, orientation: self.imageOrientation)
      return image
    }
    
    return nil
  }
  
  /// Correcting image orientation because after taking from Camera, the returned image doesn't always get proper orientation
  ///
  /// - Parameters:
  ///   - position: Camera position, back or front
  ///   - orientation: specified camera orientation
  /// - Returns: rotated image that should have proper orientation
  public func imageRotated(position: AVCaptureDevice.Position, orientation: AVCaptureVideoOrientation) -> UIImage {
    var transform = CGAffineTransform.identity
    let w: CGFloat = size.width * scale
    let h: CGFloat = size.height * scale
    let dw: CGFloat = w
    let dh: CGFloat = h
    guard let cgImage = cgImage else { return self }
    var newimage = UIImage(cgImage: cgImage, scale: 1.0, orientation: .up)
    switch orientation {
    case .landscapeLeft:
      if position == .back {
        return newimage
      }
      newimage = UIImage(cgImage: cgImage, scale: 1.0, orientation: .upMirrored)
      transform = transform.translatedBy(x: w, y: h)
      transform = transform.scaledBy(x: -1.0, y: -1.0)
    case .landscapeRight:
      if position == .front {
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: .upMirrored)
      }
      transform = transform.translatedBy(x: w, y: h)
      transform = transform.scaledBy(x: -1.0, y: -1.0)
    default:
      // portrait
      if position == .front {
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: .leftMirrored)
      }
      return self
    }
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width: dw, height: dh), true, 1.0)
    UIGraphicsGetCurrentContext()?.concatenate(transform)
    newimage.draw(in: CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: w, height: h), blendMode: .copy, alpha: 1.0)
    // swiftlint:disable force_unwrapping
    newimage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newimage
  }
  
  /// Make image circle with a given size and border color
  ///
  /// - Parameters:
  ///   - size: specific size
  ///   - color: border color
  /// - Returns: circle image
  public class func circle(size: CGFloat, color: UIColor) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), false, 0)
    let ctx = UIGraphicsGetCurrentContext()
    ctx?.saveGState()
    let rect = CGRect(x: 1.4, y: 4.5, width: 4, height: 4)
    ctx?.setFillColor(color.cgColor)
    ctx?.fillEllipse(in: rect)
    ctx?.restoreGState()
    // swiftlint:disable force_unwrapping
    let image = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
  }
  
  public func imageResize (sizeChange:CGSize) -> UIImage {
    
    let hasAlpha = true
    let scale: CGFloat = 0.0 // Use scale factor of main screen
    
    UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
    self.draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    defer { UIGraphicsEndImageContext() }
    // swiftlint:disable force_unwrapping
    return scaledImage!
  }
  
  /// Generate relevant image sizes from original image, particularly in small and medium because they are standard sizes of iOS
  /// So we always have an asset in 3 sizes that consists of small, medium and origin
  ///
  /// - Parameter quality: quality of small image that wrapped by a defined Enum
  /// - Returns: list of images' data in order of small and medium
  public func generateSizes(quality: JPEGQuality) -> [Data] {
    var images = [Data]()
    /// Medium size is unnecessary for conversation image
    let mediumSize = CGSize(width: size.width * 2 / 3, height: size.height * 2 / 3)
    images.append(cropImageBy(size: mediumSize, keepSize: true).jpeg(.high))
    
    let smallSize = CGSize(width: size.width / 3, height: size.height / 3)
    let small = cropImageBy(size: smallSize, keepSize: true)
    /// Lowest quality for small size of conversation image
    images.append(small.jpeg(quality))
    return images
  }
}

