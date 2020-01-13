//
//  Extension+String.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Empty

public extension String {
    
    static var empty: String { return "" }
    
    /// Empty check on string excluding whitespaces
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
}

// Extension on Optional type for empty check on unwrapped string
public extension Optional where Wrapped == String {
    
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}
