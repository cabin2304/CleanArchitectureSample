//
//  ViewController.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import UIKit
import RxCocoa
import ServiceKit

// MARK: - Naming extensions
private typealias PrivateHandlers = SignInViewController

final class SignInViewController: BaseViewController {
  
  // MARK: - IBOutlets
  @IBOutlet private(set) weak var pressButton: UIButton!
  @IBOutlet private(set) weak var forgotButton: UIButton!
  @IBOutlet private(set) weak var signUpButton: UIButton!
  
  @IBOutlet private(set) weak var emailTextField: UITextField!
  @IBOutlet private(set) weak var pwdTextField: UITextField!
  
  // MARK: - Properties
  var viewModel: SignInViewModel!
  
  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /// Do any additional setup after loading the view.
    setup()
    binding()
  }
  
  // MARK: - Setup and Binding
  private func setup() {
    /// Dismiss keyboard when tapping on screen
    view.addGestureRecognizer(tapGesture)
  }
  
  private func binding() {
    precondition(viewModel.notNil, "ViewModel should not be nil for any reason")
    
    /// UI Controls
    rx.methodInvoked(#selector(viewWillDisappear(_:))).asDriver([]).drive(onNext: { [weak self] (_) in
      self?.view.endEditing(true)
    }).disposed(by: disposeBag)
    
    /// Start binding
    let input = SignInViewModel.Input(email: emailTextField.driveText(), pwd: pwdTextField.driveText(),
                                      press: pressButton.driver(), forgot: forgotButton.driver(), signup: signUpButton.driver())
    let output = viewModel.transform(input: input)
    
    /// Bind reponses
    output.error.ignoreNil().drive(onNext: {[unowned self] msg in self.errorPopup |> msg}).disposed(by: disposeBag)
    output.valid.drive(pressButton.rx.isEnabled).disposed(by: disposeBag)
  }
}

extension PrivateHandlers {
  
  // MARK: - Private handlers wrapper
}

class SigninViewController: UIViewController {

  // MARK: - Lifecycles
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
  }
}
