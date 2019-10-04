//
//  Localizer.swift
//  ServiceKit
//

import Foundation
import UIKit

public class Localizer: NSObject {
  
  public class func initialLocalizer() {
    methodSwizzleGivenClassName(cls: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.specialLocalizedStringForKey(_:value:table:)))
  }
  
  /// Exchange the implementation of two methods of the same Class
  static func methodSwizzleGivenClassName(cls: AnyClass,
                                          originalSelector: Selector,
                                          overrideSelector: Selector) {
    guard let origMethod: Method = class_getInstanceMethod(cls, originalSelector) else { return }
    guard let  overrideMethod: Method = class_getInstanceMethod(cls, overrideSelector) else { return }
    if class_addMethod(cls, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
      class_replaceMethod(cls, overrideSelector, method_getImplementation(origMethod), method_getTypeEncoding(origMethod))
    } else {
      method_exchangeImplementations(origMethod, overrideMethod)
    }
  }
}
