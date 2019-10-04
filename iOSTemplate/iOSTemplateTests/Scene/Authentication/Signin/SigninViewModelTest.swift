//
//  SigninViewModelTest.swift
//  iOSTemplateTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import XCTest
@testable import iOSTemplate
import RxSwift
import RxCocoa
import RxBlocking
import ServiceKit
import Domain
import NetworkPlatform

class SigninViewModelTest: XCTestCase {

  var viewModel: SignInViewModel!
  var navigator: SigninNavigatorMock!
  var useCaseMock: AuthUseCaseMock!
  
  var disposeBag: DisposeBag!
  
  override func setUp() {
    super.setUp()
      
      navigator = SigninNavigatorMock()
      useCaseMock = AuthUseCaseMock()
      viewModel = SignInViewModel(navigator: navigator,
                                  authUseCase: useCaseMock)
      disposeBag = DisposeBag()
  }

  override func tearDown() {
    super.tearDown()
  }
  
  func testSigninInvoked() {
    
    let press = PublishSubject<Void>()
    _ = viewModel.transform(input: createInput(email: Driver.just("tuanvo@gmail.com"),
                                               pwd: Driver.just("abcABC@123"),
                                               press: press.asDriver(())))
    useCaseMock.req_ReturnValue = .next(user())
    press.onNext(())
    
    XCTAssertTrue(navigator.toHome_Called)
  }
  
  func testTracking() {
    let press = PublishSubject<()>()
    let output = viewModel.transform(input: createInput(email: Driver.just("tuanvo@gmail.com"), pwd: Driver.just("abcABC@123"),
                                                        press: press.asDriver(())))
    let expectedExecuting = [true, false]
    var actualExecuting = [Bool]()
    
    /// Collect result with ignore 2 very first emittions, it means bypass the initial values
    output.executing.skip(2).do(onNext: { actualExecuting.append($0) },
                        onSubscribe: { actualExecuting.append(true) })
    .drive().disposed(by: disposeBag)
    
    /// Fire an Press action
    press.onNext(())
    
    /// Compare expected and actual results
    XCTAssertEqual(actualExecuting, expectedExecuting)
  }
  
  func testAuthError() {
      
    let press = PublishSubject<()>()
    let output = viewModel.transform(input: createInput(email: Driver.just("abcxyz@gmail.com"), pwd: Driver.just("abcABC@123"),
                                                          press: press.asDriver(())))
    useCaseMock.req_ReturnValue = .error(APIError(code: 400, message: "Unknown"))
    output.error.drive().disposed(by: disposeBag)
    press.onNext(())
      
    let error = try! output.error.toBlocking().first()!
      
    XCTAssertFalse(navigator.toHome_Called)
    XCTAssertNotNil(error)
    XCTAssertEqual(error?.message, "Unknown")
  }
  
  func testOtherActions() {
    
    let forgotPwd = PublishSubject<Void>()
    let signUp = PublishSubject<Void>()
    _ = viewModel.transform(input: createInput(forgot: forgotPwd.asDriver(()), signup: signUp.asDriver(())))
    
    forgotPwd.onNext(())
    XCTAssertTrue(navigator.toForgotPassword_Called)
    
    signUp.onNext(())
    XCTAssertTrue(navigator.toSignUp_Called)
  }
  
  private func createInput(email: Driver<String> = Driver.just(""),
                           pwd: Driver<String> = Driver.just(""),
                           press: Driver<Void> = Driver.never(),
                           forgot: Driver<Void> = Driver.never(),
                           signup: Driver<Void> = Driver.never()) -> SignInViewModel.Input {
    return SignInViewModel.Input(email: email, pwd: pwd, press: press, forgot: forgot, signup: signup)
  }
  
  private func user() -> UserProfile {
    return UserProfile(userId: "12345678",
                       userName: "tuanvo",
                       firstName: "MinhTuan",
                       lastName: "Vo",
                       email: "tuanvo@gmail.com")
  }
}
