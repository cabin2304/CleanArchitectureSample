//
//  AppSyncClient.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import AWSAppSync
import AWSS3
import RxSwift
import Domain
import ServiceKit

public struct AppSynClient {
  
  public enum ItemState: Int {
    case normal = 0, adding, updating, deleting
    
    var val: Int {
      return self.rawValue
    }
    
    init(_ state: Int) {
      switch state {
      case 1: self = .adding
      case 2: self = .updating
      case 3: self = .deleting
      default: self = .normal
      }
    }
  }
  
  static var shared = AppSynClient()
  var appSyncClient: AWSAppSyncClient?
  lazy var dbURL: URL = {
    // Reach the link for getting fimaliar with this initialization: https://aws-amplify.github.io/docs/ios/api#client-initialization
    let path = FileManager.default.urls(for: .libraryDirectory, in: .allDomainsMask)[0]
    let dbURL = path.appendingPathComponent(AWSConfig.appsyncLocalDB.value)
    return dbURL
  }()
  
  /// Initilize AppSyncClient. We should call this after the authroization gets successed
  mutating func initialize() {
    do {
      
      let cacheConfiguration = AWSAppSyncCacheConfiguration(from: dbURL)
      let appSyncServiceConfig = try AWSAppSyncServiceConfig()
      
      /* NOTE: In order to take advantage of AWS S3 auto uploading,
       we should generate the wrappers by passing the `--add-s3-wrapper` flag while running the code generator tool,
       otherwise AWSS3TransferUtility will not be cast to AWSS3ObjectManager and return nil.
       `aws-appsync-codegen generate posts.graphql --schema schema.json --output ../API/API.swift --add-s3-wrapper`
      */
      let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: appSyncServiceConfig,
                                                            cacheConfiguration: cacheConfiguration,
                                                            s3ObjectManager: AWSS3TransferUtility.default() as? AWSS3ObjectManager)
      appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
      
      // FIXME: we can change "id" to our Model primariry key name  respectively
      // Reach the link for more details: https://aws-amplify.github.io/docs/ios/api#client-architecture
      appSyncClient?.apolloClient?.cacheKeyForObject = { $0["id"] }
    } catch {
      Service.log.debug(error.localizedDescription)
    }
  }
}

extension AppSynClient {
  
  static func errorHandling(_ error: AWSAppSyncClientError) -> APIError {
    switch error {
    case .authenticationError:
      return APIError(code: 401, message: error.errorDescription)
    case .noData(let res):
      return APIError(code: res.statusCode, message: "No Data")
    case .parseError(_, let res, let err):
      return APIError(code: res.statusCode, message: err?.localizedDescription)
    case .requestFailed(_, let res, let err):
      return APIError(code: res?.statusCode ?? 400, message: err?.localizedDescription)
    }
  }
}

