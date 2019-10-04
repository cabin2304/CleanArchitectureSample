//
//  Queue.swift
//  ServiceKit
//

import Foundation

public struct Queue {

  // MARK: - Properties
  private var objects = [Any]()
  public var left: Int {
    return objects.count
  }
  public var isEmpty: Bool {
    return objects.isEmpty
  }

  public init() {}

  /// Functions that used for push/pop as well as getting object from queue

  /// Push object to queue
  ///
  /// - Parameter obj: expected object
  public mutating func push(_ obj: Any) {
    objects.append(obj)
  }

  /// Push multiple objects to queue
  ///
  /// - Parameter objs: list of objects
  public mutating func push(_ objs: [Any]) {
    objects.append(contentsOf: objs)
  }

  /// Removing first object from queue
  ///
  /// - Returns: obj if not nil, otherwise nil
  public mutating func pop() -> Any? {
    return objects.isEmpty ? nil : objects.removeFirst()
  }

  /// Retrieving first obj in queue
  ///
  /// - Returns: obj if not nil, otherwise nil
  public func peek() -> Any? {
    return objects.first
  }

  /// Retrieving last obj in queue
  ///
  /// - Returns: obj if not nil, otherwise nil
  public func back() -> Any? {
    return objects.last
  }

  /// Clean up the queue
  public mutating func deleteAll() {
    objects.removeAll()
  }

  /// Updating first obj of queue
  ///
  /// - Parameter obj: new object
  public mutating func updateFirst(obj: Any) {
    if !objects.isEmpty {
      objects[0] = obj
    }
  }
}
