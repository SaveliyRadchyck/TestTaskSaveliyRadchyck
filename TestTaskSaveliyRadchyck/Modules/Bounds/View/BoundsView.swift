//
//  BoundsView.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class BoundsView: UIView {
    
    var upperBoundTextField: UITextField = {
        let obj = UITextField()
        obj.textAlignment = .left
        obj.textColor = .black
        obj.tintColor = .gray
        obj.backgroundColor = .clear
        obj.layer.masksToBounds = true
        obj.clearButtonMode = .whileEditing
        obj.borderStyle = .roundedRect
        obj.layer.cornerRadius = 25
        obj.font = .boldSystemFont(ofSize: 20)
        obj.attributedPlaceholder = NSAttributedString(string: "Bounds.Upper.Description".localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        obj.layer.borderColor = UIColor.gray.cgColor
        obj.layer.borderWidth = 1
        obj.clearButtonMode = .whileEditing
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        obj.leftViewMode = UITextField.ViewMode.always
        obj.leftView = spacerView
        return obj
    }()
    
    var lowerBoundTextField: UITextField = {
        let obj = UITextField()
        obj.textAlignment = .left
        obj.textColor = .black
        obj.tintColor = .gray
        obj.backgroundColor = .clear
        obj.layer.masksToBounds = true
        obj.clearButtonMode = .whileEditing
        obj.borderStyle = .roundedRect
        obj.layer.cornerRadius = 25
        obj.font = .boldSystemFont(ofSize: 20)
        obj.attributedPlaceholder = NSAttributedString(string: "Bounds.Lower.Description" .localized(), attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        obj.layer.borderColor = UIColor.gray.cgColor
        obj.layer.borderWidth = 1
        obj.clearButtonMode = .whileEditing
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        obj.leftViewMode = UITextField.ViewMode.always
        obj.leftView = spacerView
        return obj
    }()
    
    
    var getCommentsButton: UIButton = {
        let obj = UIButton(type: .roundedRect)
        obj.layer.cornerRadius = 25
        obj.layer.borderWidth = 1
        obj.layer.borderColor = UIColor.gray.cgColor
        obj.layer.backgroundColor = UIColor.clear.cgColor
        obj.setTitle("Bounds.Request.Send".localized(), for: .normal)
        obj.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        obj.setTitleColor(.gray, for: .normal)
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
        backgroundColor = .white
        
        addSubview(lowerBoundTextField)
        addSubview(upperBoundTextField)
        addSubview(getCommentsButton)
        
        lowerBoundTextField.keyboardType = .numberPad
        upperBoundTextField.keyboardType = .numberPad
        addConstraits()
    }
    
    // MARK: Add constraint for views
    
    private func addConstraits() {
        upperBoundTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.height.equalTo(50)
        }
        
        lowerBoundTextField.snp.makeConstraints { (make) in
            make.top.equalTo(upperBoundTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.height.equalTo(50)
        }
        
        
        getCommentsButton.snp.makeConstraints { (make) in
            make.top.equalTo(lowerBoundTextField.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-7)
            make.height.equalTo(50)
            
        }
    }
}

