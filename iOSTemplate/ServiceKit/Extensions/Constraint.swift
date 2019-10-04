//
//  Constraint.swift
//  ServiceKit
//

import Foundation
import UIKit

// MARK: - NSLayoutConstraint
public extension NSLayoutConstraint {

  /// Changing multiplier constraint
  ///
  /// - Parameter multiplier: multiplier value of constraint
  /// - Returns: NSLayoutConstraint object
  @discardableResult func setMultiplier(multiplier: CGFloat, cpriority: Float = 1000) -> NSLayoutConstraint {
    NSLayoutConstraint.deactivate([self])
    guard let firstItem = firstItem else { return NSLayoutConstraint() }

    let newConstraint = NSLayoutConstraint(
      item: firstItem,
      attribute: firstAttribute,
      relatedBy: relation,
      toItem: secondItem,
      attribute: secondAttribute,
      multiplier: multiplier,
      constant: constant)

    newConstraint.priority = UILayoutPriority(rawValue: cpriority)
    newConstraint.shouldBeArchived = self.shouldBeArchived
    newConstraint.identifier = self.identifier

    NSLayoutConstraint.activate([newConstraint])
    return newConstraint
  }
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>,
                                _ to: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
  return { view, parent in
    view[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], constant: constant)
  }
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
  return equal(keyPath, keyPath, constant: constant)
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, to: UIView, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
  return equal(keyPath, to: to, keyPath, constant: constant)
}

public func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, to: UIView,
                                _ toAnchor: KeyPath<UIView, Anchor>,
                                constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
  return { view, _ in
    view[keyPath: keyPath].constraint(equalTo: to[keyPath: toAnchor], constant: constant)
  }
}

public typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

public extension Collection where Element == Constraint {
  static func allEqual(margin: CGFloat = 0) -> [Constraint] {
    return [
      equal(\.leadingAnchor, constant: margin),
      equal(\.trailingAnchor, constant: margin),
      equal(\.topAnchor, constant: margin),
      equal(\.bottomAnchor, constant: margin)
    ]
  }
  
  static func allEqual(margin: CGFloat = 0, to view: UIView) -> [Constraint] {
    return [
      equal(\.leadingAnchor, to: view, constant: margin),
      equal(\.trailingAnchor, to: view, constant: margin),
      equal(\.topAnchor, to: view, constant: margin),
      equal(\.bottomAnchor, to: view, constant: margin)
    ]
  }
  
  static func allEqualSafeArea(margin: CGFloat = 0) -> [Constraint] {
    if #available(iOS 11.0, *) {
      return [
        equal(\.leadingAnchor, \.safeAreaLayoutGuide.leadingAnchor, constant: margin),
        equal(\.trailingAnchor, \.safeAreaLayoutGuide.trailingAnchor, constant: margin),
        equal(\.topAnchor, \.safeAreaLayoutGuide.topAnchor, constant: margin),
        equal(\.bottomAnchor, \.safeAreaLayoutGuide.bottomAnchor, constant: margin)
      ]
    } else {
      return [
        equal(\.leadingAnchor, \.leadingAnchor, constant: margin),
        equal(\.trailingAnchor, \.trailingAnchor, constant: margin),
        equal(\.topAnchor, \.topAnchor, constant: margin),
        equal(\.bottomAnchor, \.bottomAnchor, constant: margin)
      ]
    }
  }
  
  static func allEqualSafeArea(margin: CGFloat = 0, to view: UIView) -> [Constraint] {
    if #available(iOS 11.0, *) {
      return [
        equal(\.leadingAnchor, to: view, \.safeAreaLayoutGuide.leadingAnchor, constant: margin),
        equal(\.trailingAnchor, to: view, \.safeAreaLayoutGuide.trailingAnchor, constant: margin),
        equal(\.topAnchor, to: view, \.safeAreaLayoutGuide.topAnchor, constant: margin),
        equal(\.bottomAnchor, to: view, \.safeAreaLayoutGuide.bottomAnchor, constant: margin)
      ]
    } else {
      return [
        equal(\.leadingAnchor, to: view, \.leadingAnchor, constant: margin),
        equal(\.trailingAnchor, to: view, \.trailingAnchor, constant: margin),
        equal(\.topAnchor, to: view, \.topAnchor, constant: margin),
        equal(\.bottomAnchor, to: view, \.bottomAnchor, constant: margin)
      ]
    }
  }
}

public extension UIView {
  
  func addSubview(_ child: UIView, constraints: [Constraint]) {
    addSubview(child)
    child.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints.map { $0(child, self) })
  }
  
  func insertSubview(_ view: UIView, at index: Int, constraints: [Constraint]) {
    insertSubview(view, at: index)
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints.map { $0(view, self) })
  }
  
  func layout(to view: UIView, constraints: [Constraint]) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints.map { $0(view, self) })
  }
}
