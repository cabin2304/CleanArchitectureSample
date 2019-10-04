//
//  Application.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import Domain
import NetworkPlatform

struct Application {
  
  // MARK: - Singleton pattern
  static var shared = Application()
  
  func configMainInterface(window: UIWindow?) {
    
    logger.debug(Config.apiURL.value)
    /// Determine the root view when the app gets launched based on user's logged-in state
    // Rolling into Welcome page if it's the first time
    if SecureKey.User.confirmed.value ?? false {
      /// TODO: To Landing page
      if let vc = UIStoryboard(storyboard: AppStoryboard.Main).instantiateInitialViewController() {
        switchRoot(vc: vc, window: window)
      }
      return
    }
    
    if SecureKey<String>.User.email.value.isNil {
      let navigation = UINavigationController()
      let useCaseProvider = UseCaseProviderFactory.makeUseCaseProvider()
      let authUseCase = useCaseProvider.makeAuthUseCase(baseURL: Config.apiURL.value)
      DefaultSignInNavigator(navigation: navigation, authUseCase: authUseCase).toSignIn()
      switchRoot(vc: navigation, window: window)
      return
    }
  }
  
  private func switchRoot(vc: UIViewController, window: UIWindow?) {
    /// Make it as a root vc
    window?.rootViewController = vc
    window?.makeKeyAndVisible()
  }
}
