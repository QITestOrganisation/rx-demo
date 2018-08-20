//
//  RxDemoTests.swift
//  RxDemoTests
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa
import RxBlocking
@testable import RxDemo

class RxDemoTests: XCTestCase {
    
    var scheduler: TestScheduler!
    var disposeBag = DisposeBag()
    override func setUp() {
        
        scheduler = TestScheduler(initialClock: 0)

        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testObserservable()  {
        
        let elements = try! Observable.of(1,2,3,4,5,6,7).toBlocking().first()
        
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
