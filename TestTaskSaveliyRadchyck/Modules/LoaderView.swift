//
//  Loader.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/13/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit

class LoaderView: UIView {
    
    private var loaderActivity: UIActivityIndicatorView = {
        let obj = UIActivityIndicatorView()
        obj.style = .whiteLarge
        obj.startAnimating()
        return obj
    }()
    
     var cancelButton: UIButton = {
        let obj = UIButton()
        obj.setTitle("Cancel".localized(), for: .normal)
        obj.layer.borderWidth = 1
        obj.layer.borderColor = UIColor.white.cgColor
        obj.layer.cornerRadius = 8
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        layer.cornerRadius = 8
        
        addSubview(loaderActivity)
        addSubview(cancelButton)
        addConstraint()
    }
    
    private func addConstraint() {
        loaderActivity.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.bottom.left.right.equalToSuperview()
        }
    }
}
