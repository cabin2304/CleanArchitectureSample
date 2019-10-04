//
//  CommonEnum.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation

// MARK: - Navigation bar
enum NavBarTitle: String {
  
  case signup = "Sign Up"
  case createAccount = "Create Account"
  case login =  "Log In"
  
  var name: String {
    return rawValue
  }
}

enum MessageDialog {
  
  enum ContactHandler: String {
    
    case denied = "App requires access to Contacts. Would you like to open settings and grant permission to Contacts?"
    
    var content: String {
      return rawValue
    }
  }
  
  enum AccessPhotoable: String {
    
    case cannotAccessPhoto = "In order to continue, please allow App to access your photos library in iOS Setting."
    case cannotAccessCamera = "In order to continue, please allow App to access the camera in iOS Setting."
    
    var content: String {
      return rawValue
    }
  }
  
  enum TimeOut: String {
    case title = "Session Timed Out"
    case content = "We logged you out to keep your data safe."
    var name: String {
      return rawValue
    }
  }
}
