//
//  Theme.swift
//  ServiceKit
//


import UIKit

public enum Theme: Int {
  
  case blue = 0, aquamarine, violet, pink, red
  
  public var color: UIColor {
    switch self {
    case .aquamarine:   return UIColor(hex: "23C3C8")
    case .violet:       return UIColor(hex: "9264D2")
    case .pink:         return UIColor(hex: "FB2176")
    case .red:          return UIColor(hex: "E80000")
    default:            return UIColor(hex: "458CFD")
    }
  }
  
  public var value: Int {
    return rawValue
  }
  
  public var mapsColor: UIColor {
    return color
  }
  
  public var textColor: UIColor {
    switch self {
    case .aquamarine:   return UIColor(hex: "053638")
    case .violet:       return UIColor(hex: "281A3C")
    case .pink:         return UIColor(hex: "470620")
    case .red:          return UIColor(hex: "4D0000")
    default:            return UIColor(hex: "240C39")
    }
  }
  
  public var lineColor: UIColor {
    return textColor.withAlphaComponent(0.35)
  }
  
  public var defaultGradient: [UIColor] {
    switch self {
    case .aquamarine:   return [UIColor(hex: "23C3C8"), UIColor(hex: "20A2A6")]
    case .violet:       return [UIColor(hex: "9264D2"), UIColor(hex: "8759AF")]
    case .pink:         return [UIColor(hex: "FB2176"), UIColor(hex: "D91C68")]
    case .red:          return [UIColor(hex: "E80000"), UIColor(hex: "B70100")]
    default:            return [UIColor(hex: "458CFD"), UIColor(hex: "4279CE")]
    }
  }
  
  public var gradientView: [UIColor] {
    return defaultGradient
  }
  
  public var gradientButton: [UIColor] {
    return defaultGradient
  }
  
  public var imageView: UIColor {
    return color
  }
  
  public var defaultTint: UIColor {
    return self.color.withAlphaComponent(0.35)
  }
  
  public var tintColor: UIColor {
    return self.color
  }
}

public struct ThemeManager {
  
  /// Retrieve selected theme from cache
  ///
  /// - Returns: color of theme
  public static var theme: Theme {
    guard let val = UserDefaults.standard.string(forKey: "PreferringTheme"),
          let theme = Theme(rawValue: toNum(theme: val)) else { return .blue  }
    return theme
  }
  
  /// Because the server will return text instead of number, so we need to convert to number
  private static func toNum(theme: String?) -> Int {
    guard let theme = theme else { return 0 }
    switch theme.lowercased() {
    case "blue":     return 0
    case "aquamarine":  return 1
    case "blueviolet":      return 2
    case "deeppink":        return 3
    case "crimson":         return 4
    default: return 0
    }
  }
  
  /// Convert picked theme in number to text
  ///
  /// - Parameter theme: picked theme
  /// - Returns: in text
  public static func toString(theme: Int) -> String {
    guard let theme = Theme(rawValue: theme) else { return "Blue" }
    switch theme {
    case .aquamarine:   return "Aquamarine"
    case .violet:       return "BlueViolet"
    case .pink:         return "DeepPink"
    case .red:          return "Crimson"
    default:            return "Blue"
    }
  }
}
