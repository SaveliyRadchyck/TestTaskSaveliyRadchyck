//
//  Extension+Dictionary.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation

func +<Key, Value>(left: Dictionary<Key, Value>, right: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
    
    var result = left
    right.forEach{ result[$0] = $1 }
    
    return result
}

public extension Dictionary {
    
    mutating func append(contentsOf right: Dictionary) {
        for (key, value) in right {
            self[key] = value
        }
    }
}

