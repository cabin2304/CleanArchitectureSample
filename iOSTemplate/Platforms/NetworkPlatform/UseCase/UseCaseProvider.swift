//
//  UseCaseProvider.swift
//  NetworkPlatform
//

import Foundation
import Domain

final public class UseCaseProvider: UseCaseProviderProtocol {
  
  public func makeAuthUseCase(baseURL: String) -> AuthUseCaseProtocol {
    return AuthUseCase(network: Network<UserProfile>(baseURL: baseURL))
  }
  
  public static var shared = UseCaseProvider()
}
