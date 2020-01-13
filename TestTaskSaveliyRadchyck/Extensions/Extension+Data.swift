//
//  Extension+Data.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation

public extension Data {
    
    var json: Dictionary<String, Any>? {
        return (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) as? Dictionary<String, Any>
    }
}
