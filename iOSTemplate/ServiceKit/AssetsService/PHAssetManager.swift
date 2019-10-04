//
//  PHAssetManager.swift
//  ServiceKit
//

import UIKit
import Photos

public struct PHAssetManager {

  // MARK: - Instance & Properties
  private static let shared = PHAssetManager()
  private let imageManager = PHCachingImageManager()
  public typealias Action = () -> Void

  /// PHAsset request image options with delivery mode
  public static let imageRequestOption: PHImageRequestOptions = {
    let option = PHImageRequestOptions()
    option.isSynchronous = true
    option.isNetworkAccessAllowed = true
    option.deliveryMode = .highQualityFormat
    return option
  }()

  /// PHAsset request image options with exact image size mode
  public static let requestOption: PHImageRequestOptions = {
    let options = PHImageRequestOptions()
    options.isSynchronous = true
    options.resizeMode = .exact
    options.isNetworkAccessAllowed = true
    return options
  }()

  /// Query PHAssets predicate
  private static let options: PHFetchOptions = {
    let options = PHFetchOptions()
    options.includeAssetSourceTypes = [.typeUserLibrary, .typeiTunesSynced, .typeCloudShared]
    /// Configs predicate to make sure that the app just fetches image type only
    options.predicate = NSPredicate(format: "mediaType = \(PHAssetMediaType.image.rawValue)")
    return options
  }()

  /// PHAsset request image option with just Network access allowed only
  public static let optionNonSync: PHImageRequestOptions = {
    let option = PHImageRequestOptions()
    option.isNetworkAccessAllowed = true
    return option
  }()

  public static func highQualitySynchronousLocalOptions() -> PHImageRequestOptions {
    let options = PHImageRequestOptions()
    options.deliveryMode = .highQualityFormat
    options.isNetworkAccessAllowed = false
    options.isSynchronous = true

    return options
  }

  /// Start authorizing the accessibility of Photos
  ///
  /// - Parameters:
  ///   - allowed: callback for allowed state
  ///   - unallowed: callback for denied state
  public static func authorizeForAccess(_ allowed: @escaping Action, _ unallowed: @escaping Action) {
    if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.notDetermined {
      PHPhotoLibrary.requestAuthorization({ (status) in
        status == PHAuthorizationStatus.authorized ? allowed(): unallowed()
      })
    } else if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
      allowed()
    } else {
      unallowed()
    }
  }

  /// Retreiving last screenshot in PHAsset type from Gallery
  ///
  /// - Returns: an optional asset
  public static func fetchLastScreenshot() -> PHAsset? {
    let options = PHFetchOptions()

    options.fetchLimit = 1
    options.includeAssetSourceTypes = [.typeUserLibrary]
    options.wantsIncrementalChangeDetails = false
    options.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", PHAssetMediaSubtype.photoScreenshot.rawValue)
    options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

    return PHAsset.fetchAssets(with: .image, options: options).firstObject
  }

  /// Listing out all albums from Photos library, every album should include name, number of elements, thumbnail and a PHFetchResult object
  ///
  /// - Parameters:
  ///   - sort: closure for sorting albums list by one of its elements
  ///   - reindex: reindex the list by comparing one of the elements
  ///   - filter: filtering the list by asset name
  ///   - create: create a generic object outside with specified properties that consists of album name, count, thumbnail and fetch object
  ///   - completed: callback for completing the progressing
  public static func retrieveAlbums<T>(filter: @escaping (T, String) -> Bool, create: @escaping (String, Int, UIImage, PHFetchResult<PHAsset>) -> T) -> (PHFetchResult<PHAssetCollection>, [T]) {
    var albums = [T]()
    /// Fetching all available asset collections
    let albumColelctions = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
    let collections = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
    var counter = collections.count + albumColelctions.count

    func retrieveRecursion(assets: PHFetchResult<PHAsset>, total: Int, index: Int, sync: @escaping (UIImage) -> Void) {
      var index = index
      PHAssetManager.retrieveImage(asset: assets.object(at: index), sync: { (img) in
        /// Mapping collection's info to Album data model
        if let img = img {
          sync(img)
          counter -= 1
        } else if index > 0 {
          index -= 1
          retrieveRecursion(assets: assets, total: total, index: index, sync: sync)
        } else {
          counter -= 1
        }
      })
    }

    func generation(collection: PHFetchResult<PHAssetCollection>) {
      collection.enumerateObjects({ (obj, _, _) in
        /// Fetching assets in specified collection
        let images = PHAsset.fetchAssets(in: obj, options: PHAssetManager.options)
        let count = images.count
        if let name = obj.localizedTitle, albums.filter({ filter($0, name) }).isEmpty, count > 0 {
          /// Using Revision algorithm to generating album thumbnail to ensure that the thumbnail wont be missed
          retrieveRecursion(assets: images, total: count, index: count - 1, sync: { (img) in
            albums.append(create(name, count, img, images))
          })
        } else {
          counter -= 1
        }
      })
    }
    generation(collection: collections)
    generation(collection: albumColelctions)
    return (collections, albums)
  }

  /// Fetching a specific image from PHAsset
  ///
  /// - Parameters:
  ///   - asset: target asset
  ///   - sync: a callback param to send back image after fetching
  public static func retrieveImage(asset: PHAsset, size: CGFloat = 70, sync: @escaping (UIImage?) -> Void) {
    if asset.mediaType == .image {
      let scale = UIScreen.main.scale
      let cropSize = CGSize(width: size * scale, height: size * scale)
      _ = autoreleasepool {
        PHAssetManager.shared.imageManager.requestImage(for: asset, targetSize: cropSize, contentMode: .aspectFill, options: PHAssetManager.requestOption, resultHandler: { (img, _) in
          /// Just send back non-nil image
          sync(img)
        })
      }
    } else {
      sync(nil)
    }
  }

  /// Converting a PHFetchResult to an array of assets
  ///
  /// - Parameter fetchResult: given PHFetchResult parameter
  /// - Returns: array of assets
  private static func toArray(_ fetchResult: PHFetchResult<PHAsset>) -> [PHAsset] {
    var objs = [PHAsset]()
    fetchResult.enumerateObjects({ (asset, _, _) in
      objs.append(asset)
    })
    return objs.reversed()
  }

  /// Caching a list of assets to local to avoid re-retrieving them later
  ///
  /// - Parameter assets: list of cacheable assets
  private static func caching(assets: [PHAsset]) {
    /// Asynchronous requesting image from assets
    Thread.onUtility {
      PHAssetManager.shared.imageManager.startCachingImages(for: assets,
                                                            targetSize: PHImageManagerMaximumSize,
                                                            contentMode: .aspectFill,
                                                            options: PHAssetManager.imageRequestOption)
    }
  }

  /// Retrieve image from a specific asset with given request options
  ///
  /// - Parameters:
  ///   - asset: target asset
  ///   - option: request options
  ///   - sync: callback for return image result back
  public static func retrieveImage(from asset: PHAsset, option: PHImageRequestOptions = PHAssetManager.optionNonSync, sync: @escaping (UIImage) -> Void) {
    Thread.onUtility {
      PHAssetManager.shared.imageManager.requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: option, resultHandler: { (img, _) in
        /// Just send back non-nil image
        Thread.onMain { if let img = img { sync(img) } }
      })
    }
  }

  /// Retrieve image from specific asset in Data type
  ///
  /// - Parameters:
  ///   - asset: target asset
  ///   - sync: callback for return image data back
  public static func retrieveImageData(from asset: PHAsset, sync: @escaping (Data) -> Void) {
    Thread.onUtility {
      PHAssetManager.shared.imageManager.requestImageData(for: asset, options: PHAssetManager.optionNonSync) { (data, _, _, _) in
        Thread.onMain { if let result = data { sync(result) } }
      }
    }
  }

  /// Determine type of given object to save to local properly
  ///
  /// - Parameter data: given object in Any type
  public static func saveFile(data: Any) {
    if let img = data as? UIImage {
      UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
    } else if let data = data as? Data {
      PHPhotoLibrary.shared().performChanges({
        PHAssetCreationRequest.forAsset().addResource(with: .photo, data: data, options: nil)
      }, completionHandler: nil)
    }
  }
}
