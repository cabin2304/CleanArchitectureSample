//
//  AWSError.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation

enum AWSError: String {
  
  case wronguser = "Authentication Delegate Not Set"
  case userNotFound = "User does not exist"
  case unexpectedError = "An unexpected error occurs. Please try again!"
  
  var desc: String {
    return rawValue
  }
  
  func match(_ err: String) -> Bool {
    return err.lowercased().contains(desc.lowercased())
  }
}
