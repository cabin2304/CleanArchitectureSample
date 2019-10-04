//
//  UseCaseProvider.swift
//  Domain
//

import Foundation

// Define all use case for domain system
public protocol UseCaseProviderProtocol {
  
  func makeAuthUseCase(baseURL: String) -> AuthUseCaseProtocol 
}

public protocol AWSUseCaseProviderProtocol {
  
  func makeAuthUseCase() -> AWSAuthUseCaseProtocol
  func makePostUseCase() -> AWSPostUseCaseProtocol
}
