//
//  TestCase.swift
//  RxDemoTests
//
//  Created by Muhammad Amir Pervaiz on 8/20/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import XCTest
@testable import RxDemo

class TestCase: XCTestCase {
    
    var environment: Environment!
    override func setUp() {
        environment = Environment.init(sharedService: MockServiceManager())
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
