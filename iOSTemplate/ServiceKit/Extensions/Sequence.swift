//
//  Sequence.swift
//  ServiceKit
//

import Foundation

public extension Sequence {

  func categorise<U, E>(dict: inout [U:[E]], _ key: (Iterator.Element) -> U, _ element: (Iterator.Element) -> E) {
    for el in self {
      let key = key(el)
      if case nil = dict[key]?.append(element(el)) { dict[key] = [element(el)] }
    }
  }

  func find(_ find: (Iterator.Element) -> Bool) -> Iterator.Element? {
    for it in self where find(it) { return it }
    return nil
  }

  func group<U: Hashable>(by key: (Iterator.Element) -> U) -> [U:[Iterator.Element]] {
    var categories: [U: [Iterator.Element]] = [:]
    for element in self {
      let key = key(element)
      if case nil = categories[key]?.append(element) {
        categories[key] = [element]
      }
    }
    return categories
  }
}
