//
//  ViewExtTest.swift
//  ServiceKitTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import XCTest
@testable import ServiceKit

class ViewExtTest: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testSnapshot() {
    let mainView = UIView(frame: UIScreen.main.bounds)
    let snapshot = mainView.snapshot()
    XCTAssertNotNil(snapshot, "Snapshot should always be taken successfully")
  }
}
