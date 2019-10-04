//
//  AuthUseCase.swift
//  NetworkPlatform
//

import Foundation
import Domain
import RxSwift
import Alamofire
import ServiceKit

final class AuthUseCase {
 
  /// MARK: - Internal properties
  private let network: Network<UserProfile>
  let jsonDecoder: JSONDecoder
  private typealias API = AuthEndpoint
  private let reachability: ReachabilityService
  
  init(network: Network<UserProfile>) {
    self.network = network
    jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .formatted(DateFormat.formal.dateFormatter)
    // swiftlint:disable force_try
    reachability = try! DefaultReachabilityService()
  }
}

extension AuthUseCase: AuthUseCaseProtocol, AuthMapping {
  
  /// MARK: - Auth
  public func signIn(email: String, pwd: String) -> Observable<APIResponse<UserProfile>> {
    return network.post(endpoint: API.signIn(email: email, password: pwd)).map({ self.map() |> (nil, $0) })
  }
  
  public func signUp(email: String, pwd: String, firstName: String, lastName: String) -> Observable<APIResponse<UserProfile>> {
    return network.post(endpoint: API.signUp(email: email, pwd: pwd, firstName: firstName, lastName: lastName)).map({ self.map() |> (nil, $0) })
  }
  
  public func logout() {
    network.request(endpoint: API.logout)
  }
}
