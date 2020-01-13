//
//  Comment.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation

struct Comment: CodableExpanded {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}

extension Comment: Equatable {
    
    static func == (_ lhs: Comment, _ rhs: Comment) -> Bool {
        return lhs.id == rhs.id
    }
}
