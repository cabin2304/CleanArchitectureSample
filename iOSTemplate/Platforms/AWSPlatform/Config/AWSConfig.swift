//
//  AWSConfig.swift
//  AWSPlatform
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation

enum AWSConfig {
  
  case appsyncLocalDB
  
  var value: String {
    switch self {
    default:
      return String(describing: self)
    }
  }
}
