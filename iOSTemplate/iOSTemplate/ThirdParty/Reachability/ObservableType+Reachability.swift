//
//  ObservableType+Reachability.swift
//  Pods
//
//  Created by Ivan Bruel on 22/03/2017.
//
//

import Foundation
import RxCocoa
import RxSwift

public extension ObservableType {
  
  func retryOnConnect(timeout: TimeInterval) -> Observable<E> {
    return retryWhen { _ in
      return Reachability.rx.isConnected
        .timeout(timeout, scheduler: MainScheduler.asyncInstance)
    }
  }
}
