//
//  Array.swift
//  ServiceKit
//

import Foundation

// MARK: - Array
public extension Array {

  // MARK: - Custom functions
  func findRev(_ find: (Element) -> Bool) -> Element? {
    for it in self.reversed() where find(it) { return it }
    return nil
  }

  func unique(filter: ([Element], Element) -> Bool) -> [Element] {
    return reduce([], { (res, item) in !filter(res, item) ? res + [item] : res })
  }

  func find(_ find: (Element) -> Bool) -> Element? {
    for it in self where find(it) { return it }
    return nil
  }
}

extension Array where Element: Equatable {

  func contains(_ objs: [Element]) -> Bool {
    return !objs.contains { !self.contains($0) }
  }

  func containsAnyOf(_ objs: [Element]) -> Bool {
    for it in objs where self.contains(it) { return true }
    return false
  }
}
