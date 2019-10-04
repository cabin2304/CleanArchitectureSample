//
//  AuthUseCaseProtocol.swift
//  Domain
//

import Foundation
import RxSwift

public protocol AuthUseCaseProtocol {
  
  func signIn(email: String, pwd: String) -> Observable<APIResponse<UserProfile>>
  func signUp(email: String, pwd: String, firstName: String, lastName: String) -> Observable<APIResponse<UserProfile>>
  func logout()
}

public protocol AWSAuthUseCaseProtocol {
  
  func signIn(email: String, password: String) -> Observable<APIResponse<Bool>>
  func signUp(email: String, pwd: String, attributes: [String: String]) -> Observable<APIResponse<Bool>>
  func confirmCode(_ code: String, email: String) -> Observable<APIResponse<Bool>>
  func resendCode(email: String) -> Observable<APIResponse<Bool>>
  func getAttributes(_ completion: @escaping (String) -> Void)
  func fetchTokens(_ completion: ((String?) -> Void)?)
  func intercept(_ app: UIApplication, url: URL, source: String?, annotation: Any) -> Bool
  func logout()
}

