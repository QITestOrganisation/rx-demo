//
//  SearchCellViewModelTest.swift
//  RxDemoTests
//
//  Created by Muhammad Amir Pervaiz on 8/20/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import XCTest
import RxSwift

@testable import RxDemo

class SearchCellViewModelTest: XCTestCase {
    
    var viewModel: SearchCellViewModelType!
    var disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testDisplayCellWithMovieObject() {
        
        let movie  = Movie.template
        viewModel = SearchCellViewModel()
        
        viewModel.outputs.title.subscribe(onNext: { (title) in
            XCTAssertEqual(title, movie.title )
        }).disposed(by: disposeBag)
        
        viewModel.outputs.date.subscribe(onNext: { (date) in
            XCTAssertEqual(date, movie.release_date )

        }).disposed(by: disposeBag)
        
        viewModel.outputs.overView.subscribe(onNext: { (overview) in
            XCTAssertEqual(overview, movie.overview )

        }).disposed(by: disposeBag)
        
        viewModel.outputs.image.subscribe(onNext: { (image) in
            XCTAssertEqual(image, URL.init(string: movie.poster_path!) )

        }).disposed(by: disposeBag)
        
        
        viewModel.inputs.configure(movie)
        
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
