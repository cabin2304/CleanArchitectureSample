//
//  StringExtTest.swift
//  ServiceKitTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import XCTest
@testable import ServiceKit

class StringExtTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testTrim() {
    let testStr = "jfksdjf "
    XCTAssertEqual(testStr.trim(), "jfksdjf", "Should be trimmed")
    
    let testStr2 = "  fsdf ksdf              "
    XCTAssertEqual(testStr2.trim(), "fsdf ksdf")
    
    let testStr3 = "  fsdf ksdf   fdkkkf           "
    XCTAssertEqual(testStr3.trim(), "fsdf ksdf   fdkkkf")
  }
  
  func testTruncate() {
    let testStr = "oeropopopopooooo ooooo"
    XCTAssertEqual(testStr.truncate(length: 10), "oeropopopo")
    
    XCTAssertEqual(testStr.truncate(length: 100), "oeropopopopooooo ooooo")
    
    XCTAssertEqual(testStr.truncate(length: -1), "oeropopopopooooo ooooo")
  }
  
  func testIsZero() {
    XCTAssertTrue("0".isZero)
    XCTAssertTrue("0.0".isZero)
    XCTAssertTrue("0.0000000000000".isZero)

    XCTAssertFalse("a".isZero)
    XCTAssertFalse("1".isZero)
    XCTAssertFalse("0.1".isZero)
    XCTAssertFalse("0.0000000001".isZero)
  }
  
  func testSub() {
    let testStr = "kkkkkkkkkkkkkkk"
    XCTAssertEqual(testStr[...5], "kkkkkk")
    XCTAssertEqual(testStr[5...], "kkkkkkkkkk")
  }
}
