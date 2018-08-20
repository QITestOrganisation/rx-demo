//
//  SearchCellViewModel.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift

public protocol SearchCellViewModelInputs {
    
    /// Call when viewdidLoad is called
    func configure(_ value: Movie)
}

public protocol SearchCellViewModelOutputs {
    
    // Emits when title is displayed
    var title: Observable<String> { get }
    
    // Emits when image is displayed
    var image: Observable<URL> { get }
    
    // Emits when date is displayed
    var date: Observable<String> { get }
    
    // Emits when overView is displayed
    var overView: Observable<String> { get }
}

public protocol SearchCellViewModelType {
    
    var inputs: SearchCellViewModelInputs { get }
    var outputs: SearchCellViewModelOutputs { get }
}

public final class SearchCellViewModel: SearchCellViewModelType, SearchCellViewModelInputs, SearchCellViewModelOutputs  {
    
    init() {
        self.title = self.configureProperty.map{$0.original_title ?? ""}
        self.image = self.configureProperty.map{$0.backdrop_path ?? "place_holder"}.map{URL.init(string: $0)!}
        self.date = self.configureProperty.map{$0.release_date ?? ""}
        self.overView = self.configureProperty.map{$0.overview ?? ""}
    }
    
    public var title: Observable<String>
    public var image: Observable<URL>
    public var date: Observable<String>
    public var overView: Observable<String>

    public var inputs: SearchCellViewModelInputs { return self }
    public var outputs: SearchCellViewModelOutputs { return  self }
    
    fileprivate var configureProperty =  PublishSubject<Movie>()
    public func configure(_ value: Movie) {
        self.configureProperty.onNext(value)
    }
}
