//
//  Bundle.swift
//  ServiceKit
//

import Foundation

extension Bundle {
  
  @objc func specialLocalizedStringForKey(_ key: String, value: String?, table tableName: String?) -> String {
    
    if self == Bundle.main {
      let currentLanguage = AppleLanguage.currentAppleLanguage()
      
      var bundle: Bundle?
      if let _path = Bundle.main.path(forResource: AppleLanguage.currentAppleLanguageFull(), ofType: "lproj") {
        if let _bundle = Bundle(path: _path) {
          bundle = _bundle
        }
      } else if let _path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
        if let _bundle = Bundle(path: _path) {
          bundle = _bundle
        }
      } else {
        if let _path = Bundle.main.path(forResource: "Base", ofType: "lproj"), let _bundle = Bundle(path: _path) {
          bundle = _bundle
        }
      }
      return (bundle?.specialLocalizedStringForKey(key, value: value, table: tableName) ?? "")
    } else {
      return (self.specialLocalizedStringForKey(key, value: value, table: tableName))
    }
  }
}
