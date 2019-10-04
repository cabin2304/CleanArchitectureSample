//
//  BaseViewController.swift
//  iOSTemplate
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

  var disposeBag = DisposeBag()
  let activityIndicator = UIActivityIndicatorView(style: .gray)
  
  lazy var tapGesture: UITapGestureRecognizer = {
    let tapGesture = UITapGestureRecognizer()
    tapGesture.rx.event.subscribe({ [weak self] (_) in
      self?.view.endEditing(true)
    }).disposed(by: self.disposeBag)
    return tapGesture
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()

    // Dispose of any resources that can be recreated.
  }
  
  func initalAlert() -> (UIAlertController, Observable<UIAlertAction?>) {
    /// Dismissing the current alertviewcontroller if there is the one visible on the screen
    if let presenting = self.presentingViewController as? UIAlertController {
      presenting.dismiss(animated: false, completion: nil)
    }
    
    let alertViewController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    return (alertViewController, Observable.create({ (observer) in
      let okAction = UIAlertAction(title: ViewText.Button.Common.ok.title, style: .default, handler: { (alert) in
        observer.onNext(alert)
        observer.onCompleted()
      })
      alertViewController.addAction(okAction)
      return Disposables.create()
    }))
  }
  
  func errorPopup(title: String, message: String) {
    let alert = initalAlert()
    (alert.0.title, alert.0.message) = (title, message)
    alert.1.subscribe().disposed(by: disposeBag)
    present(alert.0, animated: true, completion: nil)
  }
}
