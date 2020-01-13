//
//  URLCommentEndpoint.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import Alamofire


protocol URLEndpointProtocol {
    var endpoint: String { get }
    var parameters: Parameters? { get }
}

enum URLCommentEndpoint: URLEndpointProtocol {
    case commentList(idRange: ClosedRange<Int>)
    
    var endpoint: String {
        switch self {
            
        case .commentList: return "comments/"
        }
    }
    
    var parameters: Parameters? {
        switch self {
            
        case let .commentList(idRange):
            return [
                "_start" : idRange.lowerBound,
                "_limit" : Limit.Network.PageSize.commentList
            ]
        }
    }
}
