//
//  SignInUITest.swift
//  iOSTemplateUITests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import XCTest
@testable import iOSTemplate
import ServiceKit

class SignInUITest: XCTestCase {
  
  var app: XCUIApplication!
  var query: XCUIElementQuery!
  
  override func setUp() {
    super.setUp()
      
    continueAfterFailure = false
    app = XCUIApplication()
    app.launchEnvironment = ["isUITest": ""]
    query = app.otherElements
    app.launch()
  }

  override func tearDown() {
    super.tearDown()
  }
  
  func test_signinButton_enable() {
    
    XCTAssertTrue(query.buttons["Sign In"].exists)
    XCTAssertFalse(query.buttons["Sign In"].isEnabled)
    
    /// Enter values to enable button
    query.textFields["Email"].tap()
    query.textFields["Email"].typeText("tuanvo@gmail.com")
    query.secureTextFields["Password"].tap()
    query.secureTextFields["Password"].typeText("abcd1234")
    
    XCTAssertTrue(query.buttons["Sign In"].isEnabled)
    
    let delete4LastChars = (0...3).map{_ in XCUIKeyboardKey.delete.rawValue }.joined()
    query.secureTextFields["Password"].typeText(delete4LastChars)
    XCTAssertFalse(query.buttons["Sign In"].isEnabled)
  }
  
  func test_present_error_popup() {
    query.textFields["Email"].tap()
    query.textFields["Email"].typeText("tuanvo@gmail.com")
    query.secureTextFields["Password"].tap()
    query.secureTextFields["Password"].typeText("abcd1234")
    
    /// Press Sign In with typed credentials
    query.buttons["Sign In"].tap()
    
    sleep(1)
    XCTAssertTrue(query.alerts.element.exists)
    XCTAssertEqual(query.alerts.element.title, "")
  }
}
