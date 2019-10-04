//
//  Configs.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation

// All configuration variables based on the variety of environments must be placed here

enum Config {
  
  /// Global constant properties
  case apiURL
  
  private var appSettings: [AnyHashable: Any]? {
    guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
      let plist = NSDictionary(contentsOfFile: path),
      let appSettings = plist["AppSettings"] as? [AnyHashable: Any] else {
        return nil
    }
    return appSettings
  }
  
  var value: String {
    switch self {
    case .apiURL:
      return appSettings?["ApiURL"] as? String ?? ""
    }
  }
}
