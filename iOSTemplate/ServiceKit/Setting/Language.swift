//
//  Language.swift
//  ServiceKit
//

import Foundation

public enum Language: String {
  
  case english = "English"
  case spanish = "Español"
  case chinese = "中文"
  
  public var lang: String {
    return rawValue
  }
  
  public var value: String {
    switch self {
    case .spanish: return "Spanish"
    case .chinese: return  "Chinese"
    default: return  "English"
    }
  }
}

public struct LanguageManager {
  
  /// List out all choosable languages
  public static var items: [Language] {
    return [.english, .spanish, .chinese]
  }
  
  /// Convert string to language
  public static func langOf(text: String) -> Language {
    return Language(rawValue: text) ?? .english
  }
  
  /// Convert server langauge to local language
  public static func convertLang(text: String) -> String {
    switch text {
    case "Chinese": return "中文"
    case "Spanish": return "Español"
    default: return "English"
    }
  }
  
  /// Find index of a specified language item from default list
  public static func indexOf(lang: Language) -> Int {
    return items.firstIndex(of: lang) ?? 0
  }
  
  /// Get language item from available list
  ///
  /// - Parameter index: specified index
  /// - Returns: language
  public static func langAt(index: Int) -> Language {
    return items.indices ~= index ? items[index] : .english
  }
  
  public static func changeDeviceLanguage() {
    /// Get default settings
    /// Retrieve cached preferring language in local storage
    let preferringLang = UserDefaults.standard.string(forKey: "PreferringLanguage")
    let language = LanguageManager.langOf(text: preferringLang ?? "English")
    switch language.lang {
    case Language.spanish.lang :
      AppleLanguage.setAppleLanguageTo(lang: "es")
    case Language.chinese.lang :
      AppleLanguage.setAppleLanguageTo(lang: "zh-Hans")
    default:
      AppleLanguage.setAppleLanguageTo(lang: "en")
    }
  }
}

public struct AppleLanguage {
  
  /// Get currently apple language
  ///
  /// - Returns: Current apple language
  public static func currentAppleLanguage() -> String {
    /// Retrieve Apple configured languages list
    let langArray = UserDefaults.standard.array(forKey: "AppleLanguages") ?? []
    guard let current = langArray.first as? String else { return "" }
    return String(current[..<current.index(current.startIndex, offsetBy: 2)])
  }
  
  /// Get currently full apple language
  ///
  /// - Returns: Current full apple language
  public static func currentAppleLanguageFull() -> String {
    let langArray = UserDefaults.standard.array(forKey: "AppleLanguages") ?? []
    return langArray.first as? String ?? ""
  }
  
  /// Set apple language
  ///
  /// - Parameter lang: language
  public static func setAppleLanguageTo(lang: String) {
    UserDefaults.standard.set([lang, currentAppleLanguage()], forKey: "AppleLanguages")
  }
}
