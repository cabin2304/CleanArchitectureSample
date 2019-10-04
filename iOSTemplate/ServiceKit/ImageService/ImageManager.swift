//
//  ImageManager.swift
//  ServiceKit
//

import UIKit
import Kingfisher

public struct ImageManager {

  public typealias Action = () -> Void
  public static func maxMemory(cost: UInt) {
    ImageCache.default.memoryStorage.config.totalCostLimit = Int(cost)
  }

  public static func clearCache() {
    ImageCache.default.clearMemoryCache()
  }

  /// Automatic download image from url and cache then it in storage
  ///
  /// - Parameter urlStr: image url
  public static func downloadImage(urlStr: String, completed: @escaping Action) {
    /// Ignore empty url string
    guard !urlStr.isEmpty else {
      /// Callback on main thread
      Thread.onMain { completed() }
      return
    }
    Thread.onUtility {
      if !ImageCache.default.imageCachedType(forKey: urlStr).cached {
        if let url = URL(string: urlStr) {
          ImageDownloader.default.downloadImage(with: url) { result in
            switch result {
            case .success(let value):
              /// If the downloaded file is gif then should process before storing in local
              if (urlStr as NSString).pathExtension == "gif",
                let gif = DefaultImageProcessor.default.process(item: .image(value.image), options: []) {
                KingfisherManager.shared.cache.store(gif, original: value.originalData, forKey: urlStr)
              } else {
                ImageCache.default.store(value.image, forKey: urlStr)
              }
              /// Callback on main thread
              Thread.onMain(completed)
            case .failure(let error):
              Service.log.debug("Download file: \(url) failed with error \(error.errorDescription.wrap)")
            }
          }

        }
      } else {
        /// Callback on main thread
        Thread.onMain { completed() }
      }
    }
  }

  public static func retrieveCachedImage(url: String?, completion: @escaping (UIImage?) -> Void) {
    guard let url = url else {
      completion(nil)
      return
    }
    if let img = ImageCache.default.retrieveImageInMemoryCache(forKey: url) {
      completion(img)
      return
    }
    ImageCache.default.retrieveImageInDiskCache(forKey: url, completionHandler: { (res) in
      switch res {
      case .success(let val): completion(val)
      case .failure: completion(nil)
      }
    })
  }

  /// As a part of image management, this function's for checking that whether image has been downloaded and cached in disk/memory from a respective url
  ///
  /// - Parameter url: image url
  /// - Returns: determined image being cached or not
  public static func imageAvailable(url: String) -> Bool {
    return ImageCache.default.imageCachedType(forKey: url).cached
  }

  public static func removeCachedImage(name: String) {
    ImageCache.default.removeImage(forKey: name)
  }

  public static func imageToGif(img: UIImage) -> UIImage? {
    return DefaultImageProcessor.default.process(item: .image(img), options: [])
  }

  public static func dataToGif(data: Data) -> UIImage? {
    return DefaultImageProcessor.default.process(item: .data(data), options: [])
  }

  public static func store(img: UIImage, original: Data? = nil, key: String) {
    KingfisherManager.shared.cache.store(img, original: original, forKey: key)
  }

  public static func retrieveImages(urls: [String], completed: @escaping([UIImage]) -> Void, needDownload: Action? = nil) {
    Thread.onMain {
      var result = [UIImage]()
      urls.forEach({ url in
        ImageCache.default.retrieveImage(forKey: url) { (res) in
          switch res {
          case .success(let val):
            if let img = val.image {
              result.append(img)
              if result.count == urls.count {
                completed(result)
              }
            } else {
              needDownload?()
            }
          case .failure: needDownload?()
          }
        }
      })
    }
  }

  /// Checking the given image url is a gif file or not
  ///
  /// - Parameter url: given image url
  public static func isGif(_ url: String) -> Bool {
    return (url as NSString).pathExtension == "gif"
  }

  /// Downloading and caching image from url and then rendering to imageview
  ///
  /// - Parameter urlString: image url string
  public static func renderImage(imgView: UIImageView, urlString: String, blur: Bool = false, effect: Bool = true, placeholder: UIImage? = #imageLiteral(resourceName: "icn-defaultAvatar")) {
    if let url = URL(string: urlString) {
      if effect {
        var options: KingfisherOptionsInfo = [.transition(.fade(0.25))]
        if blur {
          options.append(.processor(BlurImageProcessor(blurRadius: 10)))
        }
        imgView.kf.setImage(with: url, placeholder: placeholder, options: options)
      } else {
        imgView.kf.setImage(with: url, placeholder: placeholder)
      }
    }
  }

  public static func renderImageWithBlur(imgView: UIImageView, urlString: String, downloading: Action? = nil, downloaded: Action? = nil) {
    if let url = URL(string: urlString) {
      
      func onFail() {
        downloading?()
        var options: KingfisherOptionsInfo?
        if !ImageManager.isGif(urlString) {
          options = [.backgroundDecode]
        }
        imgView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "icn-defaultAvatar"), options: options) { _ in
          downloaded?()
        }
      }
      
      Thread.onUtility {
        ImageCache.default.retrieveImage(forKey: urlString) { (res) in
          switch res {
          case .success(let val):
            if let img = val.image {
              Thread.onMain {
                imgView.image = img
                downloaded?()
              }
            } else {
              onFail()
            }
          case .failure: onFail()
          }
        }
      }
    }
  }

  /// Performing a state of art image loading by giving two size of image in order of small and large
  /// The concept is like image progressive, if the large image has been cached in storage, it's immediately loaded to target imageview
  /// Otherwise, the download progress will take place from small size to larger
  ///
  /// - Parameters:
  ///   - imgView: target uiimageview
  ///   - photos: list of images' url, should be [small, large]
  ///   - downloading: outcoming callback for handling the download progress is executing
  ///   - downloaded: outcoming callback for handling the download progress did end
  public static func progressiveImage(imgView: UIImageView, photos: [String], downloading: Action? = nil, downloaded: Action? = nil) {
    if let origin = photos.last, let url = URL(string: origin) {
      
      func onFail() {
        downloading?()
        var options: KingfisherOptionsInfo?
        if !ImageManager.isGif(origin) {
          options = [.backgroundDecode]
        }
        /// If the origin is gif, just need to download it immediately and bypass small size because the function doesn't support gif
        if ImageManager.isGif(origin) {
          /// Downloading gif file
          imgView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "icn-defaultAvatar"), options: options) { _ in downloaded?() }
        } else {
          /// Downloading normal image
          if let small = URL(string: photos.first ?? "") {
            /// Firstly, downloading small image and make blur effect
            let coptions: KingfisherOptionsInfo = (options ?? []) + [.processor(BlurImageProcessor(blurRadius: 10))]
            imgView.kf.setImage(with: small, placeholder: #imageLiteral(resourceName: "icn-defaultAvatar"), options: coptions) { _ in
              /// After that, start downloading original image
              let finalOpts = (options ?? []) + [.keepCurrentImageWhileLoading]
              imgView.kf.setImage(with: url, options: finalOpts) { _ in downloaded?() }
            }
          } else {
            /// After that, start downloading original image
            imgView.kf.setImage(with: url, options: options) { _ in downloaded?() }
          }
        }
      }
      
      Thread.onUtility {
        ImageCache.default.retrieveImage(forKey: origin) { res in
          switch res {
          case .success(let value):
            if let img = value.image {
              if ImageManager.isGif(origin) {
                /// If the target file is gif, should process to be able to render a gif to imageview
                if let gif = DefaultImageProcessor.default.process(item: .image(img), options: []) {
                  Thread.onMain { imgView.image = gif }
                }
              } else {
                /// Otherwise, rendering as a normal image
                Thread.onMain { imgView.image = img }
              }
            } else {
              onFail()
            }
          case .failure: onFail()
          }
        }
      }
    }
  }

  /// Retrieving image from storage by name first. Converting data to image if the image didn't exist in storage.
  /// Performing caching image to storage after converting data if the corresponding flag has been activated.
  ///
  /// - Parameters:
  ///   - imgView: target imageview
  ///   - imageNamed: image name for retrieving
  ///   - data: image data
  ///   - shouldCache: flag for determining that should cache image to storage or not
  public static func renderImage(imgView: UIImageView, imageNamed: String, data: Data, shouldCache: Bool = true) {
    Thread.onUtility {
      if let gif = KingfisherManager.shared.cache.retrieveImageInMemoryCache(forKey: imageNamed) {
        Thread.onMain { imgView.image = gif }
      } else {
        if let img = DefaultImageProcessor.default.process(item: .data(data), options: []) {
          Thread.onMain { imgView.image = img }
          if shouldCache {
            KingfisherManager.shared.cache.store(img, original: data, forKey: imageNamed)
          }
        }
      }
    }
  }

  /// Downloading and caching image from url and then rendering to button
  ///
  /// - Parameter urlString: image url string
  public static func renderImage(btn: UIButton, urlString: String) {
    if let url = URL(string: urlString) {
      btn.kf.setImage(with: url, for: .normal, placeholder: #imageLiteral(resourceName: "icn-defaultAvatar"), options: [.transition(.fade(0.25))])
    }
  }

  /// Force removing image from cached storage by its name
  ///
  /// - Parameter imageNamed: target image name
  public static func removeImage(imageNamed: String) {
    KingfisherManager.shared.cache.removeImage(forKey: imageNamed)
  }

  /// Merging multiple icons to one by overlapping each other
  ///
  /// - Parameter icons: list of mergeable icons
  /// - Parameter max: maximum number of icons will be merged
  public static func mergeIcons(_ icons: [UIImage], square: CGFloat, max: Int = 3, completed: @escaping ((UIImage?, CGFloat)?) -> Void) {
    /// Ignore and break if the given list is empty
    guard !icons.isEmpty else {
      completed(nil)
      return
    }
    /// Return first icon immediately if there is only one
    if icons.count == 1 {
      completed((icons.first, square))
      return
    }
    /// Start merging and drawing a new image, slice the list according to the max number
    let images = icons.count > max ? Array(icons[0...2]) : icons
    let count = images.count
    Thread.onUserInitiated {
      let width = CGFloat(count-1)*(square/2) + square
      let size = CGSize(width: width, height: square)
      UIGraphicsBeginImageContextWithOptions(size, false, 0)
      images.reversed().enumerated().forEach({ idx, image in
        let rect = CGRect(x: CGFloat(count - 1 - idx) * square/2, y: 0, width: square, height: square)
        image.draw(in: rect)
      })
      let finalImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      /// Rendering the image result in main thread
      Thread.onMain { completed((finalImage, width)) }
    }
  }

  public static func collage(urls: [String], threadID: Int, size: CGSize = CGSize(width: 40, height: 40), completed: @escaping(UIImage) -> Void) {
    let width = size.width
    let height = size.height

    ImageManager.retrieveImages(urls: urls, completed: { images in
      let count = images.count
      UIGraphicsBeginImageContextWithOptions(size, true, 0)
      UIColor.white.setFill()
      UIRectFill(CGRect(origin: .zero, size: size))
      if count > 0 {
        if count == 1 {
          images[0].scaled(size).draw(at: CGPoint(x: 0, y: 0))
        } else if count == 2 {
          let tileSize = CGSize(width: round(width * 3/4), height: round(height * 3/4))
          images[1].scaled(tileSize).draw(at: CGPoint(x: 1/4 * width, y: 1/4 * height))
          images[0].scaled(tileSize).draw(at: CGPoint(x: 0, y: 0))
        } else {
          let tileSize = CGSize(width: round(width / 2),
                                height: height)
          let tileSize1 = CGSize(width: round(width / 2), height: round(height / 2))
          images[0].scaled(tileSize).draw(at: CGPoint(x: 0, y: 0))
          images[1].scaled(tileSize1).draw(at: CGPoint(x: width / 2, y: 0))
          images[2].scaled(tileSize1).draw(at: CGPoint(x: width / 2, y: height / 2))
        }
      }

      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      if let image = image {
        ImageCache.default.store(image, forKey: "room_\(threadID)")
        completed(image)
      }
    })
  }
}

