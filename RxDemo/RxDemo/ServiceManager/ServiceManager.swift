//
//  ServiceManager.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
import RxSwift
import Mapper
import Alamofire

/**
 This class is responsible for making api calls.
 */

public struct ServiceManager: ServiceType {
    
    
    public func searchMovie(_ query: String) -> Observable<SearchResponse> {
        return self.request(.searchMovies(query: query)).map({ (response)  in
            return SearchResponse.from(response as! NSDictionary)!
        })
}
    // Calling method using RxAlamofire which returns Observables. GET/POST request //
    private func request(_ route: Route) -> Observable<Any>   {
        return Observable.create { observer in
            
            let request = Alamofire.request(BASE_URL + route.routeProperties.url, method: route.routeProperties.method, parameters: route.routeProperties.params, headers: route.routeProperties.headers).responseJSON { (response) in
                
                switch response.result {
                case .success:
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        observer.onNext(response.result.value)
                    }
                    else {
                        let error = NSError.init(domain: "spuul.com", code: (response.response?.statusCode)!, userInfo: nil)
                        //observer.on(.error(error))
                        observer.onError(error)
                        print(response.result.value)
                        
                    }
                case .failure(let error):
                    print(error)
                    observer.onError(error)
                }
            }
            //observer.on(.completed)
            return Disposables.create {
                request.cancel()
            }
            
            }
            .observeOn(MainScheduler.instance)
    }

    
}
