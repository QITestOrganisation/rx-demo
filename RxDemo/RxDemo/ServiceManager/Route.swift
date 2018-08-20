//
//  Route.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import Alamofire

enum Route {
    
    case searchMovies(query: String)
    
    var routeProperties: (method: HTTPMethod, url: String, params: [String: Any], headers: HTTPHeaders) {
        switch self {
        case .searchMovies(let query):
            return (.get, "/search/movie?api_key=\(API_KEY)&query=\(query)&page=1", [:], [:])
        }
    }
}
