//
//  SigninNavigatorMock.swift
//  iOSTemplateTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

@testable import iOSTemplate

class SigninNavigatorMock: SignInNavigator {
  
  var toSignIn_Called = false
  func toSignIn() {
     toSignIn_Called = true
   }
  
  var toSignUp_Called = false
  func toSignUp() {
    toSignUp_Called = true
  }
  
  var toForgotPassword_Called = false
  func toForgotPassword() {
    toForgotPassword_Called = true
  }
  
  var toHome_Called = false
  func toHome() {
    toHome_Called = true
  }
}
