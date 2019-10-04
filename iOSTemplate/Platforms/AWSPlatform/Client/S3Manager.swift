//
//  S3Manager.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import AWSS3
import RxSwift
import Domain
import ServiceKit

public struct S3Manager {
  
  public typealias UploadedResponse = (index: Int, url: String)
  public typealias UploadData = (Data, folder: String, fileName: String)
    
  public static var shared = S3Manager()
  private var didStartSession = false
  private var folder = "", bucketName = "", prefixURL = ""
  private var dir: URL {
    return URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("images")
  }
  public var dirDownloads: URL {
    return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as String)
  }
  
  init() {
    createDirs()
  }
  
  public mutating func configS3(folder: String, bucketName: String, prefixURL: String) {
    
    /// Initializing instance
    self.bucketName = bucketName
    self.prefixURL = prefixURL
    /// format: '/protected/${cognito-identity.amazonaws.com:sub}/*'
    self.folder = folder
//    self.folder = folder + "/\(AWSAuthorization.shared.clientID)"
  }
  
  public func makeS3Input(key: String, localURI: String) -> S3ObjectInput {
    return S3ObjectInput(bucket: bucketName, key: key, region: "us-east-1", localUri: localURI, mimeType: "image/jpeg")
  }
  
  public func s3(key: String, uri: String? = nil) -> PostItem.Image {
    return PostItem.Image(bucket: bucketName, key: key, region: "us-east-1", localUri: uri.isNilOrEmpty() ? nil : uri)
  }
  
  public func startSession() {
    guard !didStartSession else { return }
    let getPreSignedURLRequest = AWSS3GetPreSignedURLRequest()
    getPreSignedURLRequest.bucket = bucketName
    getPreSignedURLRequest.httpMethod = .PUT
    getPreSignedURLRequest.key = "image.jpeg"
    getPreSignedURLRequest.expires = Date(timeIntervalSinceNow: 86400)
    AWSS3PreSignedURLBuilder.default().getPreSignedURL(getPreSignedURLRequest).continueWith { (task) in
      /// Mark that the session has been started
      if task.error != nil {
        S3Manager.shared.didStartSession = true
      }
      return nil
    }
  }
  
  public func deleteObjects(images: [String]) {
    var array:[AWSS3ObjectIdentifier] = []
    images.forEach { (fileName) in
      if let obj = AWSS3ObjectIdentifier() {
        obj.key = "\(self.folder)/" + fileName
        array.append(obj)
      }
    }
    let s3Remove = AWSS3Remove()
    s3Remove?.objects = array
    
    guard let deleteObjectRequest =  AWSS3DeleteObjectsRequest() else { return }
    deleteObjectRequest.bucket = self.bucketName
    deleteObjectRequest.remove = s3Remove
    
    AWSS3.default().deleteObjects(deleteObjectRequest) { (response, error) in
      if let error = error {
        Service.log.debug("Cannot delete image: \(error)")
      } else if response.notNil {
        Service.log.debug("Bucket deleted successfully.")
      }
    }
  }
  
  public func downloadImage(fileName: String) -> Observable<APIResponse<String>>{
    let request = createDownloadRequest(fileName: fileName)
    return Observable.create({ (observer) in
      guard !fileName.isEmpty else {
        observer.onNext(.next(""))
        observer.onCompleted()
        return Disposables.create()
      }
      if let req = request.0, let key = req.key {
        AWSS3TransferUtility.default().download(to: req.downloadingFileURL, key: key, expression: nil)
          .continueWith(block: { (task) -> Any? in
          if task.result.notNil, task.isCompleted, !task.isFaulted {
            observer.onNext(.next(request.1))
          } else if let err = task.error, let info = err._userInfo {
            observer.onNext(.error(APIError(code: 400, message: info["message"], title: nil)))
          }
          observer.onCompleted()
          return nil
        })
      }
      return Disposables.create()
    })
  }
  
  public func parallelUpload(imgData: [UploadData], completed: @escaping (UploadedResponse?) -> Void) {
    let requests = imgData.map({ self.createRequest(data: $0.0, subfolder: $0.folder) })
    var tasks = [AWSTask<AnyObject>]()
    requests.enumerated().forEach { (idx, request) in
      if let req = request.0, let key = req.key, let cType = req.contentType {
        tasks.append(AWSS3TransferUtility.default().uploadFile(req.body, key: key,
                                                               contentType: cType, expression: nil)
          .continueWith(block: { (task) -> Any? in
          self.removeFile(at: request.2)
          if task.result != nil, task.isCompleted, !task.isFaulted {
            /// Send back uploaded image url
            let formattedURL = self.prefixURL + "/\(self.bucketName)/" + request.1
            Service.log.debug(formattedURL)
            completed((idx, formattedURL))
          } else {
            completed(nil)
          }
          if let err = task.error {
            Service.log.debug(err)
          }
          return nil
        }))
      }
    }
  }
  
  private func createRequest(data: Data, subfolder: String) -> (AWSS3TransferManagerUploadRequest?, String, String) {
    let (ext, contentType) = isGif(data) ? (".gif", "image/gif") : (".jpeg", "image/jpeg")
    let fileName = ProcessInfo.processInfo.globallyUniqueString.appending(ext)
    let key = "\(subfolder)/" + fileName
    let fileURL = dir.appendingPathComponent(fileName)
    do {
      try data.write(to: fileURL, options: .atomic)
      let request = AWSS3TransferManagerUploadRequest()
      request?.body = fileURL
      request?.key = key
      request?.bucket = bucketName
      request?.contentType = contentType
      return (request, key, "\(subfolder)/" + fileName)
    } catch let err {
      Service.log.debug(err)
      return (nil, key, subfolder)
    }
  }
  
  private func createDownloadRequest(fileName: String) -> (AWSS3TransferManagerDownloadRequest?, String) {
    let request = AWSS3TransferManagerDownloadRequest()
    let downloadingFileUrl = dirDownloads.appendingPathComponent(String(fileName.dropFirst()))
    let ext = fileName.components(separatedBy: ".").last ?? ""
    
    request?.downloadingFileURL = downloadingFileUrl
    request?.key = self.folder + fileName
    request?.bucket = bucketName
    request?.responseContentType = ext == "jpeg" ? "image/jpeg" : "image/gif"
    
    Service.log.debug(request.debugDescription)
    return (request, downloadingFileUrl.path)
  }
  
  /// Checking that the data is gif or not
  private func isGif(_ data: Data) -> Bool {
    var buffer = [UInt8](repeating: 0, count: 1)
    (data as NSData).getBytes(&buffer, range: NSRange(location: 0, length: 1))
    return buffer == [0x47]
  }
  
  /// Removing temp file from a specified path
  ///
  /// - Parameter path: file path in temp directory
  private func removeFile(at path: String) {
    let fileURL = dir.appendingPathComponent(path)
    do {
      try FileManager.default.removeItem(at: fileURL)
    } catch let err {
      Service.log.debug(err)
    }
  }
  
  /// Creating necessary temp directories to store images that will be uploaded and removed right after
  private func createDirs() {
    do {
      try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
    } catch let err {
      Service.log.debug(err)
    }
  }
}
