//
//  Environment.swift
//  RxDemo
//
//  Created by Muhammad Amir Pervaiz on 8/19/18.
//  Copyright © 2018 Muhammad Amir Pervaiz. All rights reserved.
//

import UIKit
/**
 A collection of **all** global variables and singletons that the app wants access to.
 */

public final class Environment: NSObject {

    static let environment = Environment()
    
    /// For making calls
    var sharedService: ServiceType
    
     init(sharedService: ServiceType = ServiceManager()) {
        self.sharedService = sharedService
    }
    
}
