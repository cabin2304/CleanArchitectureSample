//
//  SignInNavigator.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import UIKit
import Domain
import ServiceKit
import NetworkPlatform

protocol SignInNavigator {
  
  func toSignUp()
  func toForgotPassword()
  func toHome()
}

struct DefaultSignInNavigator: SignInNavigator {
  
  // MARK: - Properties
  private weak var navigation: UINavigationController!
  private let authUseCase: AuthUseCaseProtocol
  
  // MARK: - Initialization and Conforms
  init(navigation: UINavigationController, authUseCase: AuthUseCaseProtocol) {
    self.navigation = navigation
    self.authUseCase = authUseCase
  }
  
  func toSignIn() {
    let vc = UIStoryboard(storyboard: AppStoryboard.Signin).instantiate(SignInViewController.self)
    vc.viewModel = SignInViewModel(navigator: self, authUseCase: authUseCase)
    navigation.fadeRoot(vc)
  }
  
  func toSignUp() {
    /// TODO: TBA
//    DefaultSignUpNavigator(navigation: navigation, authUseCase: AuthUseCaseProtocol).toSignUp()
  }
  
  func toForgotPassword() {
    
  }
  
  func toHome() {
    // DefaultHomeNavigator(navigation: navigation, postUseCase: PostAPI()).toHome()
  }
}
