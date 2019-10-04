//
//  AuthUseCaseMock.swift
//  iOSTemplateTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import RxSwift
import Domain
import NetworkPlatform

class AuthUseCaseMock: AuthUseCaseProtocol {
  
  var signIn_Called = false
  var signUp_Called = false
  var logout_Called = false
  
  var req_ReturnValue: APIResponse<UserProfile> = .completed
  
  func signIn(email: String, pwd: String) -> Observable<APIResponse<UserProfile>> {
    signIn_Called = true
    return Observable.just(req_ReturnValue)
  }
  
  func signUp(email: String, pwd: String, firstName: String, lastName: String) -> Observable<APIResponse<UserProfile>> {
    signUp_Called = true
    return Observable.just(req_ReturnValue)
  }
  
  func logout() {
    logout_Called = true
  }
}
