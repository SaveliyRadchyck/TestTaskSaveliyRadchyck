//
//  BaseViewController.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/12/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: Property view
    
    let loaderView = LoaderView.init(frame: CGRect.init(origin: .zero, size: .init(width: 150, height: 150)))
    
    private var cancelAction: Block?
}

// MARK: - Loader

extension BaseViewController {
    func loaderShow(cancelAction: Block? = nil) {
        loaderView.cancelButton.addTarget(self, action: #selector(loaderCancel), for: .touchUpInside)
        self.cancelAction = cancelAction
        PKHUD.sharedHUD.contentView = loaderView
        PKHUD.sharedHUD.show()
    }
    
    func loaderHide() {
        cancelAction = nil
        PKHUD.sharedHUD.hide()
    }
    
    @objc private func loaderCancel() {
        cancelAction?()
        cancelAction = nil
    }
}


// MARK: - Error

extension BaseViewController {
    
    func handleErrors(errors: ErrorsDict) {
        var alertKey: String? // Only one error should be displayed as popup
        for (key, error) in errors {
            if let edisp = errorDisplayable(for: key) {
                edisp.error = error
            } else {
                alertKey = key
            }
        }
        
        if let key = alertKey,
            let error = errors[key] {
            self.showAlert(title: key, error: error)
        }
    }
    
    // MARK: - ErrorDisplayable
    
    func errorDisplayable(in view: UIView) -> Array<ErrorDisplayable> {
        var eds: Array<ErrorDisplayable> = []
        
        for subview in view.subviews {
            if let edisp = subview as? ErrorDisplayable { eds.append(edisp) }
            if subview.subviews.count > 0 { eds.append(contentsOf: errorDisplayable(in: subview)) }
        }
        return eds
    }
    
    func errorDisplayable(for identifier: String) -> ErrorDisplayable? {
        return errorDisplayable(in: self.view).first(where: { (edisp) -> Bool in
            let identifiers = edisp.accessibilityIdentifier?.trimmingCharacters(in: .whitespaces).components(separatedBy: ",")
            return identifiers?.contains(identifier) ?? false
        })
    }
}



// MARK: Alerts

extension BaseViewController {
    
    func showAlert(title: String = "Error".localized(), error: Error) {
        self.showAlert(title: title, message: error.localizedDescription)
    }
    
    func showAlert(title: String? = nil, message: String!, buttonTitle: String! = "OK".localized(), action: ((UIAlertAction) -> Void)? = nil) {
        showAlert(title: title, message: message, buttons: [
            UIAlertAction.init(title: buttonTitle, style: .default, handler: action)
        ])
    }
}

