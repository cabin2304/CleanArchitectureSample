//
//  BaseViewModel.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import RxCocoa
import RxSwift
import Domain
import ServiceKit

// A common protocol of ViewModel part.
/*
 All common functions for ViewModel type will be placed in extension instead of protocol,
 because it's not required for the child class to conform those functions.
 */

protocol BaseViewModel {}

extension BaseViewModel {
  
  func validate(_ form: Driver<(String, String)>) -> Driver<Bool> {
    let email = form.map{ Validation.email($0.0) }.map{ $0 }
    let pwd   = form.map{ Validation.password($0.1) }.map{ $0 }
    return Driver.combineLatest(email, pwd){ ($0 && $1) }
  }
  /// Reusable function for handling network response and publishing corresponding signals
  ///
  /// - Parameters:
  ///   - publisher: signal publisher
  ///   - res: target response
  func resHandler<T>(publisher: PublishSubject<T>, res: APIResponse<T>, error: PublishSubject<MessageContent?>) {
    switch res {
    case .next(let result): publisher.onNext(result)
    case .error(let err): self.errorHandler(err: err, error: error)
    case .completed: break
    }
  }
  
  func handleWithoutPublish<T>(res: APIResponse<T>, error: PublishSubject<MessageContent?>) {
    switch res {
    case .next(let res): logger.debug(res)
    case .error(let err): self.errorHandler(err: err, error: error)
    case .completed: break
    }
  }
  
  /// Seperate function for network error handling
  ///
  /// - Parameter err: receivied error from response
  func errorHandler(err: APIError?, error: PublishSubject<MessageContent?>) {
    /// Publish error content to view
    /// Using default title and message if the receiving error is nil
    error.onNext((err?.title ?? Title.Error.network.desc, err?.message ?? Message.Error.network.desc))
  }
}
