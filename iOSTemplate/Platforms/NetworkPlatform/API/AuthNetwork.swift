//
//  AuthNetwork.swift
//  NetworkPlatform
//

import Foundation
import Alamofire
import RxSwift
import ServiceKit
import Domain

enum AuthEndpoint: Endpoint {
  
  case signIn(email: String, password: String)
  case signUp(email: String, pwd: String, firstName: String, lastName: String)
  case logout
  
  var path: String {
    switch self {
    case .signIn:  return "login/"
    case .signUp:  return "signup/"
    case .logout:  return "logout/"
    }
  }
  
  var parameters: JSON? {
    switch self {
    case .signIn(let usr, let pwd):      return ["email": usr, "password": pwd]
    case .signUp(let email, let password, let firstName, let lastName):
      return ["email": email, "password": password, "first_name": firstName, "last_name": lastName]
    default: return nil
    }
  }
  
  var encoding: ParameterEncoding {
    return JSONEncoding.default
  }
  
}

