//
//  Constants.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Network

let kUrlBase = "https://jsonplaceholder.typicode.com/"

// MARK: - Typealias

typealias JSON          = Dictionary<String, Any>
typealias ErrorsDict    = Dictionary<String, Error> // For errors from server response

typealias ResponseObjectBlock<T: Any> = (_ value: T?, _ error: ErrorsDict?) -> Void

typealias Block = () -> Void

// MARK: - Wrappers

// Wrappers for Alamofire types - helps to avoid import in every file
typealias Request  = DataRequest
typealias Response = DataResponse

// MARK: - Limits

struct Limit {
    private init() {}
    
    struct Network {
        private init() {}
        
        struct PageSize {
            private init() {}
            
            static let commentList = 10
        }
    }
}
