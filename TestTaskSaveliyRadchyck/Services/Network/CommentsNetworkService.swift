//
//  CommentsNetworkService.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import Alamofire

protocol CommentsNetworkServiceProtocol: BaseNetworkServiceProtocol {
    
    /// Get list of comments from server
    ///
    /// - Parameters:
    ///   - idRange: comment id, where to start and end
    @discardableResult
    func commentsGet(idRange: ClosedRange<Int>, completion: @escaping ResponseObjectBlock<Array<Comment>>) -> Request
}


class CommentsNetworkService: BaseNetworkService, CommentsNetworkServiceProtocol {
    
    func commentsGet(idRange: ClosedRange<Int>, completion: @escaping ResponseObjectBlock<Array<Comment>>) -> Request {
        let endpoint = URLCommentEndpoint.commentList(idRange: idRange)
        let networkRequest = request(urlEndpoint: endpoint, method: .get)
        networkRequest.responseModelArray { (response: Response<Array<Comment>>) in
            switch response.result {
                
            case .success(let value):
                let comments = value.filter({ $0.id >= idRange.lowerBound && $0.id <= idRange.upperBound })
                completion(comments, nil)
                
            case .failure(let error):
                // Cancel case
                guard (error as NSError).code != 4 else { return }
                completion(nil, BaseNetworkService.parseErrors(response: response))
            }
        }
        return networkRequest
    }
}
