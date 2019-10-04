//
//  Redirect.swift
//  ServiceKit
//

import UIKit

public struct Redirect {
  
  public static func itunes(appID: String) {
    if let url = URL(string: "itms-apps://itunes.apple.com/app/\(appID)"), UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }
  
  public static func settings(url: String = UIApplication.openSettingsURLString) {
    if let settings = URL(string: url), UIApplication.shared.canOpenURL(settings) {
      UIApplication.shared.open(settings, options: [:], completionHandler: nil)
    }
  }
}
