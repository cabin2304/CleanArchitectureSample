//
//  UseCaseProvider.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import Domain
import AWSAppSync
import AWSMobileClient
import AWSS3

public class AWSUseCaseProvider: AWSUseCaseProviderProtocol {
  
  public func makeAuthUseCase() -> AWSAuthUseCaseProtocol {
    return AuthUseCase()
  }
  
  public func makePostUseCase() -> AWSPostUseCaseProtocol {
    return PostUseCase()
  }
  
  public static var shared = AWSUseCaseProvider()
}
  
