//
//  Bunle+Localizable.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation

public extension Bundle {
    
    convenience init?(identifier: String? = nil, languageCode: String) {
        var bundle: Bundle = .main
        
        if let identifier = identifier,
            let bundleForIdentifier = Bundle.init(identifier: identifier) {
            bundle = bundleForIdentifier
        }
        
        guard let bundlePath = bundle.path(forResource: languageCode, ofType: "lproj") else { return nil }
        
        self.init(path: bundlePath)
    }
    
    /// Global static bundle, used during localization
    static var localization = Bundle.main {
        didSet {
            NotificationCenter.default.post(name: .languageChanged, object: nil)
        }
    }
}

public extension Notification.Name {
    
    static let languageChanged = Notification.Name("Localization.Language.Changed")
}
