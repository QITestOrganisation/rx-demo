//
//  MockServiceManager.swift
//  RxDemoTests
//
//  Created by Muhammad Amir Pervaiz on 8/20/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift

internal struct MockServiceManager: ServiceType {
    
    fileprivate var loginResponse: SearchResponse?
    fileprivate var loginError: Error?
    
    init(loginResponse: SearchResponse? = nil, loginError: Error? = nil) {
        self.loginError = loginError
        self.loginResponse = loginResponse
    }
    
    internal func searchMovie(_ query: String) -> Observable<SearchResponse> {
        return Observable.create { observer in
            
            if let response = self.loginResponse {
                observer.onNext(response)
            }
            else if let error = self.loginError {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
