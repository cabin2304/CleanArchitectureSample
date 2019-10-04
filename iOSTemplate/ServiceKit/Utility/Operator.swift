//
//  Operator.swift
//  ServiceKit
//

import UIKit
import RxSwift
import RxCocoa

// MARK: - Operator overloading
/// Rx two-ways binding
infix operator <->: AdditionPrecedence
/// Function injection
infix operator |>: AdditionPrecedence

/// MARK: - Implementions |>
public func |> <A, B> (f: (A) -> B, arg: A) -> B {
  return f(arg)
}

public func |> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
  return { g(f($0)) }
}

public func |> <A> (f: (A) -> Void, arg: A){
  f(arg)
}

public func |> <A> (f: () -> (A) -> Void, arg: A) {
  f() |> arg
}

public func |> <A, B> (f: (A) -> (B) -> Void, arg: A) -> (B) -> Void {
  return f(arg)
}

public func maxx<T: Comparable>(lhs: T, rhs: T) -> T {
  return lhs > rhs ? lhs : rhs
}

public func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?): return l < r
  case (nil, _?): return true
  default: return false
  }
}

// MARK: - Codable operator decode and encode
infix operator <~: AdditionPrecedence
infix operator ~>: AdditionPrecedence
infix operator <!: AdditionPrecedence
public func <~<A: Decodable, K>(property: inout A, mapping: (KeyedDecodingContainer<K>, K)) {
  do {
    if let val = try mapping.0.decodeIfPresent(A.self, forKey: mapping.1) {
      property = val
    }
  } catch {}
}

public func ~><A: Encodable, K>(container: inout KeyedEncodingContainer<K>, mapping: (A, K)) {
  do {
    try container.encode(mapping.0, forKey: mapping.1)
  } catch {}
}

public func <!<A: Decodable, K>(container: KeyedDecodingContainer<K>, key: K) -> A {
  // swiftlint:disable force_try
  return try! container.decode(A.self, forKey: key)
}

// NARK: - View
public func nonMarkedText(_ textInput: UITextInput) -> String? {
  let start = textInput.beginningOfDocument
  let end = textInput.endOfDocument

  guard let rangeAll = textInput.textRange(from: start, to: end),
    let text = textInput.text(in: rangeAll) else {
      return nil
  }

  guard let markedTextRange = textInput.markedTextRange else {
    return text
  }

  guard let startRange = textInput.textRange(from: start, to: markedTextRange.start),
    let endRange = textInput.textRange(from: markedTextRange.end, to: end) else {
      return text
  }

  return (textInput.text(in: startRange) ?? "") + (textInput.text(in: endRange) ?? "")
}

// MARK: - Implementations <->
public func <-> <Base>(textInput: TextInput<Base>, variable: BehaviorRelay<String>) -> Disposable {
  let bindToUIDisposable = variable.asObservable()
    .bind(to: textInput.text)
  let bindToVariable = textInput.text
    .subscribe(onNext: { [weak base = textInput.base] _ in
      guard let base = base else {
        return
      }

      let nonMarkedTextValue = nonMarkedText(base)

      /**
       In some cases `textInput.textRangeFromPosition(start, toPosition: end)` will return nil even though the underlying
       value is not nil. This appears to be an Apple bug. If it's not, and we are doing something wrong, please let us know.
       The can be reproed easily if replace bottom code with

       if nonMarkedTextValue != variable.value {
       variable.accept(nonMarkedTextValue ?? "")
       }

       and you hit "Done" button on keyboard.
       */
      if let nonMarkedTextValue = nonMarkedTextValue, nonMarkedTextValue != variable.value {
        variable.accept(nonMarkedTextValue)
      }
      }, onCompleted:  {
        bindToUIDisposable.dispose()
    })

  return Disposables.create(bindToUIDisposable, bindToVariable)
}

public func <-> <T>(property: ControlProperty<T>, variable: BehaviorRelay<T>) -> Disposable {

  let bindToUIDisposable = variable.asObservable()
    .bind(to: property)
  let bindToVariable = property
    .subscribe(onNext: { n in
      variable.accept(n)
    }, onCompleted:  {
      bindToUIDisposable.dispose()
    })

  return Disposables.create(bindToUIDisposable, bindToVariable)
}

// MARK: - Alias
public typealias JSON = [String: Any]
