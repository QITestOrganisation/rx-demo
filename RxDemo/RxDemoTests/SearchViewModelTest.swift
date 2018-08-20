//
//  SearchViewModelTest.swift
//  RxDemoTests
//
//  Created by Muhammad Amir Pervaiz on 8/20/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import XCTest
import RxSwift
@testable import RxDemo

class SearchViewModelTest: TestCase {
    
    var viewModel: SearchViewModelType!
    var disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testShowingIndicatorLoaderBeforeFetchingMovies() {
        var temp = false
        environment.sharedService = MockServiceManager.init(loginResponse: SearchResponse.template)
        viewModel = SearchViewModel.init(environment)
        
        /// TODO: Have to look for TestSubscriber or TestObserver to make unit tests stateless like example in RxJava and ReactiveSwift
        ///let temp =  try! self.viewModel.outputs.showIndicatorView.toBlocking().toArray().first
        
        self.viewModel.outputs.showIndicatorView.subscribe(onNext: { _ in
            temp = true
        }).disposed(by: disposeBag)
        
        self.viewModel.inputs.viewdidLoad()
        XCTAssertTrue(temp, "Loader is displayed...")
        
    }
    
    func testHideShowingIndicatorLoaderBeforeFetchingMovies() {
        var temp = false
        environment.sharedService = MockServiceManager.init(loginResponse: SearchResponse.template)
        viewModel = SearchViewModel.init(environment)
        
        /// TODO: Have to look for TestSubscriber or TestObserver to make unit tests stateless like example in RxJava and ReactiveSwift
        ///let temp =  try! self.viewModel.outputs.hideIndicatorView.map{true}.toBlocking().toArray().first
        
        self.viewModel.outputs.hideIndicatorView.subscribe(onNext: { _ in
            temp = true
        }).disposed(by: disposeBag)
        
        self.viewModel.inputs.viewdidLoad()

        XCTAssertTrue(temp, "Loader is hidden...")
    }
    
    func testShowAlertForError() {
        
        var temp = ""
        environment.sharedService = MockServiceManager.init(loginError:  NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Something went wrong"]))
        viewModel = SearchViewModel.init(environment)
       
        /// let temp =  try! self.viewModel.outputs.isErrorOccured.toBlocking().toArray().first
        self.viewModel.outputs.isErrorOccured.subscribe(onNext: { message in
            temp = message
        }).disposed(by: disposeBag)
        
        self.viewModel.inputs.viewdidLoad()
        
        XCTAssertEqual(temp, "Something went wrong")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    override func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    override func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
