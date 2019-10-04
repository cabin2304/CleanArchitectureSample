//
//  Title.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import ServiceKit

enum Title: String {
  
  case common
  var desc: String {
    switch self {
    case .common: return "title-common".localized(comment: "Oops..")
    }
    
  }
  
  enum Error: String {
    case common
    case network
    var desc: String {
      switch self {
      case .common: return "title-error-common".localized(comment: "Error")
      case .network: return "title-error-network".localized(comment: "Something went wrong")
      }
    }
  }
  
  enum SignUp {
    case warning
    var desc: String {
      switch self {
      case .warning: return "title-signup-warning".localized(comment: "Oops")
      }
    }
    
  }
  
  enum Signin {
    enum Account: String {
      case pwd
      var desc: String {
        switch self {
        case .pwd: return "title-signin-account-password".localized(comment: "Passwords Do Not Match")
        }
      }
    }
  }
}
