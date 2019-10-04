//
//  Rx.swift
//  ServiceKit
//

import RxSwift
import RxCocoa

// MARK: - RxSwift
public protocol OptionalType {

  associatedtype Wrapped

  var optional: Wrapped? { get }
}

extension Optional: OptionalType {

  public var optional: Wrapped? { return self }
  public var notNil: Bool {
    return self != nil
  }
  public var isNil: Bool {
    return self == nil
  }
}

public extension Observable where Element: OptionalType {

  func ignoreNil() -> Observable<Element.Wrapped> {
    return flatMap { value in
      value.optional.map { Observable<Element.Wrapped>.just($0) } ?? Observable<Element.Wrapped>.empty()
    }
  }
}

public extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy, E: OptionalType {
  func ignoreNil() -> Driver<E.Wrapped> {
    return flatMap { value in
      value.optional.map { Driver<E.Wrapped>.just($0) } ?? Driver<E.Wrapped>.empty()
    }
  }
}

public extension Observable {

  func asDriver(_ def: Element) -> Driver<Element> {
    return asDriver(onErrorJustReturn: def)
  }

  func void() -> Observable<Void> {
    return map { _ in }
  }
  
  func bool(_ val: Bool = true) -> Observable<Bool> {
    return map{ _ in val }
  }
}

public extension SharedSequenceConvertibleType {

  func void() -> SharedSequence<SharingStrategy, Void> {
    return map{ _ in }
  }
  
  func bool(_ val: Bool = true) -> SharedSequence<SharingStrategy, Bool> {
    return map{ _ in val }
  }
}

public extension ObservableType {
  
  func withPrevious(startWith first: E) -> Observable<(E, E)> {
    return scan((first, first)) { ($0.1, $1) }.skip(1)
  }
}

/**
 Specifies how observable sequence will be repeated in case of an error
 - Immediate: Will be immediatelly repeated specified number of times
 - Delayed:  Will be repeated after specified delay specified number of times
 - ExponentialDelayed: Will be repeated specified number of times.
 Delay will be incremented by multiplier after each iteration (multiplier = 0.5 means 50% increment)
 - CustomTimerDelayed: Will be repeated specified number of times. Delay will be calculated by custom closure
 */
public enum RepeatBehavior {
  case immediate (maxCount: UInt)
  case delayed (maxCount: UInt, time: Double)
  case exponentialDelayed (maxCount: UInt, initial: Double, multiplier: Double)
  case customTimerDelayed (maxCount: UInt, delayCalculator: (UInt) -> Double)
}

public typealias RetryPredicate = (Error) -> Bool

public extension RepeatBehavior {
  
  /**
   Extracts maxCount and calculates delay for current RepeatBehavior
   - parameter currentAttempt: Number of current attempt
   - returns: Tuple with maxCount and calculated delay for provided attempt
   */
  func calculateConditions(_ currentRepetition: UInt) -> (maxCount: UInt, delay: Double) {
    switch self {
    case .immediate(let max):
      // if Immediate, return 0.0 as delay
      return (maxCount: max, delay: 0.0)
    case .delayed(let max, let time):
      // return specified delay
      return (maxCount: max, delay: time)
    case .exponentialDelayed(let max, let initial, let multiplier):
      // if it's first attempt, simply use initial delay, otherwise calculate delay
      let delay = currentRepetition == 1 ? initial : initial * pow(1 + multiplier, Double(currentRepetition - 1))
      return (maxCount: max, delay: delay)
    case .customTimerDelayed(let max, let delayCalculator):
      // calculate delay using provided calculator
      return (maxCount: max, delay: delayCalculator(currentRepetition))
    }
  }
}

public extension ObservableType {
  
  /**
   Repeats the source observable sequence using given behavior in case of an error or until it successfully terminated
   - parameter behavior: Behavior that will be used in case of an error
   - parameter scheduler: Schedular that will be used for delaying subscription after error
   - parameter shouldRetry: Custom optional closure for checking error (if returns true, repeat will be performed)
   - returns: Observable sequence that will be automatically repeat if error occurred
   */

  func retry(_ behavior: RepeatBehavior, scheduler: SchedulerType = MainScheduler.instance, shouldRetry: RetryPredicate? = nil) -> Observable<E> {
    return retry(1, behavior: behavior, scheduler: scheduler, shouldRetry: shouldRetry)
  }

  /**
   Repeats the source observable sequence using given behavior in case of an error or until it successfully terminated
   - parameter currentAttempt: Number of current attempt
   - parameter behavior: Behavior that will be used in case of an error
   - parameter scheduler: Schedular that will be used for delaying subscription after error
   - parameter shouldRetry: Custom optional closure for checking error (if returns true, repeat will be performed)
   - returns: Observable sequence that will be automatically repeat if error occurred
   */

  internal func retry(_ currentAttempt: UInt, behavior: RepeatBehavior, scheduler: SchedulerType = MainScheduler.instance, shouldRetry: RetryPredicate? = nil)
    -> Observable<E> {
      guard currentAttempt > 0 else { return Observable.empty() }

      // calculate conditions for bahavior
      let conditions = behavior.calculateConditions(currentAttempt)

      return catchError { error -> Observable<E> in
        // return error if exceeds maximum amount of retries
        guard conditions.maxCount > currentAttempt else { return Observable.error(error) }

        if let shouldRetry = shouldRetry, !shouldRetry(error) {
          // also return error if predicate says so
          return Observable.error(error)
        }

        guard conditions.delay > 0.0 else {
          // if there is no delay, simply retry
          return self.retry(currentAttempt + 1, behavior: behavior, scheduler: scheduler, shouldRetry: shouldRetry)
        }

        // otherwise retry after specified delay
        return Observable<Void>.just(()).delaySubscription(conditions.delay, scheduler: scheduler).flatMapLatest {
          self.retry(currentAttempt + 1, behavior: behavior, scheduler: scheduler, shouldRetry: shouldRetry)
        }
      }
  }
}
