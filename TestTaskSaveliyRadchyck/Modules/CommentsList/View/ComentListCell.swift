//
//  ComentListCell.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ComentListCell: UITableViewCell {
    
    static let cellId = String(describing: type(of: self))
    
    private let idLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .black
        obj.font = UIFont.boldSystemFont(ofSize: 16)
        obj.textAlignment = .right
        obj.adjustsFontSizeToFitWidth = true
        obj.numberOfLines = 0
        return obj
    }()
    
    private let postIdLabel: UILabel = {
        let obj = UILabel()
        obj.textColor = .black
        obj.font = UIFont.systemFont(ofSize: 13)
        obj.textAlignment = .right
        obj.adjustsFontSizeToFitWidth = true
        obj.numberOfLines = 5
        return obj
    }()
    
    private let nameLabel: UILabel =  {
        let obj = UILabel()
        obj.font = UIFont.boldSystemFont(ofSize: 16)
        obj.textAlignment = .left
        obj.textColor = .black
        return obj
    }()
    
    private let emailLabel: UILabel =  {
        let obj = UILabel()
        obj.font = UIFont.boldSystemFont(ofSize: 16)
        obj.textAlignment = .left
        obj.textColor = .black
        return obj
    }()
    
    private let bodyLabel: UILabel =  {
        let obj = UILabel()
        obj.font = UIFont.boldSystemFont(ofSize: 16)
        obj.textColor = .black
        obj.numberOfLines = 0
        return obj
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // Reset ui state
        self.idLabel.text = ""
        self.postIdLabel.text = ""
        self.nameLabel.text = ""
        self.emailLabel.text = ""
        self.bodyLabel.text = ""
    }
    
    private func setup() {
        addSubview()
        addConstraint()
    }
    
    private func addSubview() {
        addSubview(idLabel)
        addSubview(postIdLabel)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(bodyLabel)
    }
    
    // MARK: add constraint
    
    private func addConstraint() {
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
        }
        
        postIdLabel.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.right.equalTo(-10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(idLabel.snp.left).offset(-20)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(idLabel.snp.left).offset(-20)
        }
        
        bodyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emailLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Variables
    // MARK: - Configure cell

    var comment: Comment! {
        didSet {
            self.idLabel.text = "CommentsList.Comment.Id".localized() + "\(comment.id)"
            self.postIdLabel.text = "CommentsList.Comment.PostId".localized() + "\(comment.postId)"
            self.nameLabel.text = "CommentsList.Comment.Name".localized() + "\(comment.name)"
            self.emailLabel.text = "CommentsList.Comment.Email".localized() + "\(comment.email)"
            self.bodyLabel.text = comment.body
        }
    }
}
