//
//  DecisionsDecisonsTests.swift
//  DecisionsDecisonsTests
//
//  Created by Drew Lanning on 6/21/16.
//  Copyright © 2016 Drew Lanning. All rights reserved.
//

import XCTest
@testable import DecisionsDecisons

class DecisionsDecisonsTests: XCTestCase {
  
  let criterion = Criterion(title: "test")
  let criterion2 = Criterion(title: "test2")
  let option = DecisionOption(title: "option")
  
  override func setUp() {
    super.setUp()
    criterion.setRating(to: Rating.threeStar)
    criterion.setWeight(to: 0.3)
    
    criterion2.setRating(to: Rating.fourStar)
    criterion2.setWeight(to: 0.7)
    
    let criteria = [criterion, criterion2]
    
    option.setAddress(to: "123 Main Street, SF CA 94116")
    option.setValue(to: 12300)
    option.setImage(url: "imageURL")
    option.setDescription(to: "option description")
    option.setCriteria(with: criteria)

  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testCriterion() {
    XCTAssert(criterion.returnWeightedRating() == 3*0.3)
    XCTAssert(criterion.rating.rawValue == 3)
    XCTAssert(criterion.title == "test")
    XCTAssert(criterion.weight == 0.3)
  }
  
  func testOption() {
    XCTAssert(option.returnAverageRating() == 3.7)
    XCTAssert(criterion.weight == 0.3)
    XCTAssert(criterion2.weight == 0.7)
    option.setDefaultWeights()
    XCTAssert(option.returnAverageRating() == 3.5)
    XCTAssert(criterion.weight == 0.5)
    XCTAssert(criterion2.weight == 0.5)
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock {
      // Put the code you want to measure the time of here.
    }
  }
  
}
