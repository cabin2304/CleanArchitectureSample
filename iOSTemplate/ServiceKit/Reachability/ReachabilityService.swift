//
//  ReachabilityService.swift
//  RxExample
//
//  Created by Vodovozov Gleb on 10/22/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if !RX_NO_MODULE
  import RxSwift
#endif
import Foundation

public enum ReachabilityStatus {
  case reachable(viaWiFi: Bool)
  case unreachable
}

extension ReachabilityStatus {
  
  var reachable: Bool {
    switch self {
    case .reachable:
      return true
    case .unreachable:
      return false
    }
  }
}

public protocol ReachabilityService {

  var reachability: Observable<ReachabilityStatus> { get }
}

enum ReachabilityServiceError: Error {
  case failedToCreate
}

public class DefaultReachabilityService: ReachabilityService {

  private let _reachabilitySubject: BehaviorSubject<ReachabilityStatus>

  public var reachability: Observable<ReachabilityStatus> {
    return _reachabilitySubject.asObservable()
  }

  public let _reachability: Reachability

  public init() throws {
    guard let reachabilityRef = Reachability() else { throw ReachabilityServiceError.failedToCreate }
    let reachabilitySubject = BehaviorSubject<ReachabilityStatus>(value: .unreachable)

    // so main thread isn't blocked when reachability via WiFi is checked
    let backgroundQueue = DispatchQueue(label: "reachability.wificheck")

    reachabilityRef.whenReachable = { reachability in
      backgroundQueue.async {
        reachabilitySubject.on(.next(.reachable(viaWiFi: reachabilityRef.isReachableViaWiFi)))
      }
    }

    reachabilityRef.whenUnreachable = { reachability in
      backgroundQueue.async {
        reachabilitySubject.on(.next(.unreachable))
      }
    }

    try reachabilityRef.startNotifier()
    _reachability = reachabilityRef
    _reachabilitySubject = reachabilitySubject
  }

  deinit {
    _reachability.stopNotifier()
  }
}

extension ObservableConvertibleType {

  public func retryOnBecomesReachable(_ valueOnFailure:E, reachabilityService: ReachabilityService) -> Observable<E> {
    return self.asObservable()
      .catchError { (e) -> Observable<E> in
        reachabilityService.reachability
          .skip(1)
          .filter { $0.reachable }
          .flatMap { _ in
            Observable.error(e)
          }
          .startWith(valueOnFailure)
      }
      .retry()
  }
}

public class RxReachabilityService {

  public static let shared = RxReachabilityService()
  public var reachabilityChanged: Observable<Reachability.NetworkStatus> {
      return reachabilitySubject.asObservable()
  }

  public init() {
    // swiftlint:disable force_unwrapping
    reachability = Reachability.init()!

    let up = reachability.currentReachabilityStatus
    reachabilitySubject = BehaviorSubject<Reachability.NetworkStatus>(value: up)

    let reachabilityChangedClosure: (Reachability) -> Void =  { [weak self] (reachability) in
      self?.reachabilitySubject.on(.next(reachability.currentReachabilityStatus))
    }

    reachability.whenReachable = reachabilityChangedClosure
    reachability.whenUnreachable = reachabilityChangedClosure

    // swiftlint:disable force_try
    try! reachability.startNotifier()
  }

  private let reachability: Reachability
  private let reachabilitySubject: BehaviorSubject<Reachability.NetworkStatus>

}
