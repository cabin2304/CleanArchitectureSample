//
//  SigninViewModel.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Domain
import ServiceKit
import NetworkPlatform

struct SignInViewModel: ViewModelType {
  
  // MARK: - Input, Output
  struct Input {
    
    let email: Driver<String>
    let pwd: Driver<String>
    
    let press: Driver<Void>
    let forgot: Driver<Void>
    let signup: Driver<Void>
  }
  
  struct Output {
    
    /// Execute
    let executing: Driver<Bool>
    let error: Driver<MessageContent?>
    let valid: Driver<Bool>
  }
  
  // MARK: - Properties
  private let navigator: SignInNavigator
  private let disposeBag = DisposeBag()
  private let authUseCase: AuthUseCaseProtocol
  
  private let error = PublishSubject<MessageContent?>()
  
  // MARK: - Initialization and Conforms
  init(navigator: SignInNavigator, authUseCase: AuthUseCaseProtocol){
    self.navigator = navigator
    self.authUseCase = authUseCase
  }
  
  func transform(input: Input) -> Output {
    
    let activity = ActivityIndicator()
    let form = Driver.combineLatest(input.email, input.pwd){ ($0, $1) }
    let valid = self.validate(form)
    
    signIn(save: input.press, form: form, activity: activity, valid: valid).asDriver(())
      .drive(onNext: navigator.toHome).disposed(by: disposeBag)
    /// Navigators
    input.signup.drive(onNext: navigator.toSignUp).disposed(by: disposeBag)
    input.forgot.drive(onNext: navigator.toForgotPassword).disposed(by: disposeBag)
  
    return Output(executing: activity.asDriver(), error: error.asDriver(nil), valid: valid)
  }
  
  // MARK: - Handlers
  private func signIn(save: Driver<Void>,
                      form: Driver<(String, String)>,
                      activity: ActivityIndicator,
                      valid: Driver<Bool>) -> PublishSubject<()> {
    let complete = PublishSubject<()>()
    save.withLatestFrom(valid).filter({ $0 }).withLatestFrom(form).flatMapLatest { (arg)  in
      return self.authUseCase.signIn(email: arg.0, pwd: arg.1).trackActivity(activity).asDriver(.error(nil))
      }.drive(onNext: { response in
        switch response {
        case .error(let err): self.handleError |> err
        case .next(let user):
          logger.debug(user)
          /// Mark the user have joined
          SecureKey.User.confirmed.set(true)
          complete.onNext(())
        default: break
        }
      }).disposed(by: disposeBag)
    return complete
  }
  
  private func handleError(err: APIError?) {
    error.onNext((Title.Error.network.desc, err?.message ?? Message.Error.network.desc))
  }
}

extension SignInViewModel: BaseViewModel {}
