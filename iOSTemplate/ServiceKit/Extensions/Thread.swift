//
//  Thread.swift
//  ServiceKit
//

/// Defind Thread system common functions
public struct Thread {
  
  public static func onMain(_ action: @escaping () -> Void) {
    DispatchQueue.main.async {
      action()
    }
  }
  
  public static func onBackground(_ action: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
      action()
    }
  }
  
  public static func onUtility(_ action: @escaping () -> Void) {
    DispatchQueue.global(qos: .utility).async {
      action()
    }
  }
  
  public static func onUserInitiated(_ action: @escaping () -> Void) {
    DispatchQueue.global(qos: .userInitiated).async {
      action()
    }
  }
  
  /// MARK: - Delay
  public static func onMain(after: TimeInterval, _ action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + after) {
      action()
    }
  }
}
