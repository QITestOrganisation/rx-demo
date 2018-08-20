//
//  SearchViewModel.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftExt
public protocol SearchViewModelInputs {
    
    /// Call when viewdidLoad is called
    func viewdidLoad()
}

public protocol SearchViewModelOutputs {
    
    // Emits when viewDidLoad is called to show loader View
    var showIndicatorView: Observable<Void> { get }
    
    // Emits on error occured.
    var isErrorOccured: Observable<String> { get }
    
    // Emits on getting movies list from api response
    var moviesList: Observable<[Movie]> { get }
    
    // Emits on getting movies list from api response
    var hideIndicatorView: Observable<Void> { get }
}

public protocol SearchViewModelType {
    
    var inputs: SearchViewModelInputs { get }
    var outputs: SearchViewModelOutputs { get }
}

public final class SearchViewModel: SearchViewModelType, SearchViewModelInputs, SearchViewModelOutputs  {
    
    init(_ environment: Environment) {
        let apiClient = environment.sharedService
        
        self.showIndicatorView = self.viewDidLoadProperty
        
        let result =  self.viewDidLoadProperty.flatMap({_ in
            return apiClient.searchMovie("Superman")
        }).materialize()
        
        self.moviesList = result.elements().map({ (response) in
            response.results!
        })
        
        self.isErrorOccured = result.errors().map{$0.localizedDescription}
        self.hideIndicatorView = self.moviesList.flatMap{_ in Observable.just(())}
    }
    
    public var inputs: SearchViewModelInputs {return self}
    public var outputs: SearchViewModelOutputs {return self}
    
    public var showIndicatorView: Observable<Void>
    public var isErrorOccured: Observable<String>
    public var moviesList: Observable<[Movie]>
    public var hideIndicatorView: Observable<Void>

    
    fileprivate var viewDidLoadProperty = PublishSubject<Void>()
    public func viewdidLoad() {
        viewDidLoadProperty.onNext(())
    }
}
