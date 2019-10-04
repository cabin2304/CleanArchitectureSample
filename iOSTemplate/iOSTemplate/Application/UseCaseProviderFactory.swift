//
//  UseCaseProviderFactory.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import Domain
import NetworkPlatform
import AWSPlatform

class UseCaseProviderFactory {
  
  class func makeUseCaseProvider() -> UseCaseProviderProtocol {
    
    return NetworkPlatform.UseCaseProvider.shared
  }
}

class AWSUseCaseProviderFactory {
  
  class func makeUseCaseProvider() -> AWSUseCaseProviderProtocol {
    
    return AWSPlatform.AWSUseCaseProvider.shared
  }
}
