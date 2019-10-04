//
//  TextField.swift
//  ServiceKit
//

import UIKit

public extension UITextField {

  /// Changing self placeholder font by inputting font
  ///
  /// - Parameter font: Font that placeholder need to be changed to
  func changePlaceholder(color: UIColor, font: UIFont) {
    let attributes = [NSAttributedString.Key.foregroundColor: color,
                      NSAttributedString.Key.font: font]
    attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
  }
}
