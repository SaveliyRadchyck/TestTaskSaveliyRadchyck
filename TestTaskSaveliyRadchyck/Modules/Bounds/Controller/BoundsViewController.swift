//
//  BoundsViewController.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit

class BoundsViewController: BaseViewController {
    
    // MARK: property
    
    let boundsView = BoundsView()
    
    // MARK: Services
    
    private lazy var commentsService: CommentsNetworkServiceProtocol = CommentsNetworkService.init()
    
    // MARK: life cycle View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    
    // MARK: Init
    
    private func initVC() {
        view = boundsView
        navigationItem.title = "Bounds.NavigationItem.Title".localized()
        hideKeyboard()
        boundsView.getCommentsButton.addTarget(self, action: #selector(touchGetCommentsButton), for: .touchUpInside)
    }
    
    private func loadComments() {
        self.hideKeyboard()
        
        guard let range = checkRange() else {
            return
        }
       let request = commentsService.commentsGet(idRange: range) { [weak self] (comments, errors) in
        self?.loaderHide()
            guard let comments = comments else {
                let errors = errors ?? ErrorsDict.init(error: NetworkErrorManager.serverError)
                self?.handleErrors(errors: errors)
                return
            }
            let commentsVC = CommentsListViewController()
            commentsVC.config(comments: comments, idRange: range)
            self?.navigationController?.pushViewController(commentsVC, animated: true)
        }
        self.loaderShow {
            request.cancel()
            self.loaderHide()
        }
    }
    
    private func checkRange() -> ClosedRange<Int>? {
        // Only numbers allowed
        guard let lowerRangeValue = Int(boundsView.lowerBoundTextField.text ?? "") else {
            showAlert(error: AppError.invalidValue)
            return nil
        }
        
        // Should be > 0 - id starts from 1
        guard lowerRangeValue > 0 else {
            showAlert(error: AppError.custom(text: "Error.Range.NonPositive".localized()))
            return nil
        }
        
        // Only numbers allowed
        guard let upperRangeValue = Int(boundsView.upperBoundTextField.text ?? "") else {
            showAlert(error: AppError.invalidValue)
            return nil
        }
        
        // Should be > 0 - id starts from 1
        guard upperRangeValue > 0 else {
            showAlert(error: AppError.custom(text: "Error.Range.NonPositive".localized()))
            return nil
        }
        
        // Upper bounds should be greated than lower
        guard upperRangeValue >= lowerRangeValue else {
            self.showAlert(message: "Error.Range.LowerBiggerThanUpper".localized())
            return nil
        }
        let range = (lowerRangeValue - 1)...upperRangeValue // id starts with '1', but index with '0'
        return range
    }
}

 // MARK: selectors

extension BoundsViewController {
   
    @objc func touchGetCommentsButton() {
        loadComments()
    }
}

// MARK: UITextFieldDelegate

extension BoundsViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow backspace
        if string.isEmpty {
            return true
        }
        
        // Only numbers allowed
        guard let _ = Int(string) else {
            return false
        }
        return true
    }
}
