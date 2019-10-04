//
//  UtilityTest.swift
//  ServiceKitTests
//
//  Created by Tuan Vo on 2019.
//  Copyright © 2019 Tuan Vo. All rights reserved.
//

import XCTest
@testable import ServiceKit

class UtilityTest: XCTestCase {
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testFormatCounter() {
    let input = [1, 10, 100, 1000, 10000, 100000]
    let expectedOuput = ["1", "10", "100", "1K", "10K", "100K"]
    let results = input.map { ServiceKit.Utility.formatCounter($0) }
    XCTAssert(results.elementsEqual(expectedOuput), "Should equal")
    
    let anotherUnitExpOutput = ["1", "10", "100", "1U", "10U", "100U"]
    let uUnitResults = input.map { ServiceKit.Utility.formatCounter($0, unit: "U") }
    XCTAssert(uUnitResults.elementsEqual(anotherUnitExpOutput), "Should equal")
  }
  
  func testRemoveValueInDict() {
    var input = ["Key": ["a", "b", "b", "c", "b", "d"]]
    let removedValue = "b"
    let expList = ["a", "c", "d"]
    ServiceKit.Utility.removeValues(removedValue, by: "Key", from: &input)
    XCTAssert(input["Key"]!.elementsEqual(expList), "Should equal")
    
    let removedValue2 = "d"
    let expInitialList = ["a", "c"]
    ServiceKit.Utility.removeValues(removedValue2, by: "Key", from: &input)
    XCTAssert(input["Key"]!.elementsEqual(expInitialList), "Should equal")
  }
}
