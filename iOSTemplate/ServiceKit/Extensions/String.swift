//
//  String.swift
//  ServiceKit
//

import Foundation
import UIKit

public extension String {

  /// MARK: - Subscripts
  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    return self[..<index(startIndex, offsetBy: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    return self[...index(startIndex, offsetBy: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    return self[index(startIndex, offsetBy: value.lowerBound)...]
  }

  func sub(to: Int) -> String {
    return String(self[...min(count - 1, to)])
  }

  func sub(from: Int) -> String {
    return String(self[max(0, from)...])
  }

  /// MARK: - Extended functions
  func trim() -> String {
    return self.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  /// Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
  func truncate(length: Int, trailing: String = "") -> String {
    guard length > 0 else { return self }
    return (self.count > length) ? (String(self.prefix(length)) + trailing) : self
  }

  /// Determine whether the given value in string type is Zero or not
 var isZero: Bool {
    if let num = self.components(separatedBy: " ").first, let inFloat = Float(num), inFloat == 0.0 {
      return true
    }
    return false
  }

  func encodeURL() -> URL? {
    if let encodedURL = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
      return URL(string: encodedURL)
    }
    return nil
  }

  func nsRange(from range: Range<Index>) -> NSRange {
    if let lower = UTF16View.Index(range.lowerBound, within: utf16),
      let upper = UTF16View.Index(range.upperBound, within: utf16) {
      return NSRange(location: utf16.distance(from: utf16.startIndex, to: lower), length: utf16.distance(from: lower, to: upper))
    }
    return NSRange()
  }
  
  func isNumber() -> Bool {
    return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
  }
  
  func underlineString(underlineString: String? = nil, color: UIColor? = nil) -> NSAttributedString {
    let attributedText = NSMutableAttributedString(string: self)
    let range = (self as NSString).range(of: underlineString ?? self)
    attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
    if let color = color{
      attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    return attributedText
  }
  
  func localized(comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
  
  func viewController<T: UIViewController>(_ viewController: T.Type) -> T {
    return UIStoryboard(storyboard: self).instantiate(viewController)
  }
}

public extension Optional where Wrapped == String {
  
  var wrap: String {
    return self ?? ""
  }
  
  func isNilOrEmpty() -> Bool {
    return isNil || self == ""
  }
}
