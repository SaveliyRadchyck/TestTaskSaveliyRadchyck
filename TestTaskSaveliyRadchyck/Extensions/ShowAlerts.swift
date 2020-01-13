//
//  ShowAlerts.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    // MARK:  Detect if controller was presented
    var isPresented: Bool {
        return (self.presentingViewController != nil || self.navigationController?.presentingViewController != nil)
    }
    
    // MARK: Simple alert popup extension
    // - Parameter title: Alert title
    // - Parameter message: Alert message
    // - Parameter buttons: List of buttons for displaying
    
    func showAlert(title: String? = nil, message: String, buttons: Array<UIAlertAction>) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        buttons.forEach({ alert.addAction($0) })
        present(alert, animated: true, completion: nil)
    }
}
