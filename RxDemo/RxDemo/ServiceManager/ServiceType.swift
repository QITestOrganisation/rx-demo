//
//  ServiceType.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift
/**
 List of methods
 */
public protocol ServiceType {
    
    /// Method for fetching movies list
    func searchMovie(_ query: String) -> Observable<SearchResponse>
    
}
