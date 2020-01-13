//
//  CommentsListViewController.swift
//  TestTaskSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/10/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import Foundation
import UIKit

class CommentsListViewController: BaseViewController {
    
    // MARK: property
    
    let commentsListView = ComentsListView()
    
    // MARK: - Services
    
    private lazy var commentsService: CommentsNetworkServiceProtocol = CommentsNetworkService.init()
    
    // MARK: - Variables
    
    private var comments: [Comment] = []
    private var idRange: ClosedRange<Int>!
    
    private var isNextPage: Bool = true
    
    // MARK: life cycle view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    
    // MARK: - Init
    private func initVC() {
        view = commentsListView
        navigationItem.title = "CommentsList.NavigationItem.Title".localized()
        initTableView()
    }
    
    func config(comments: [Comment], idRange: ClosedRange<Int>) {
        self.comments = comments
        self.idRange  = idRange
    }
    
    // MARK: - Methods
    
    private func loadNextPage() {
        guard isNextPage else { return }
        
        guard let lastCommentId = comments.last?.id else { return }
        
        // Additional check, if last item from range was already loaded
        if lastCommentId == idRange.upperBound {
            isNextPage = false
            return
        }
        let range = lastCommentId...idRange.upperBound
        
        let request = commentsService.commentsGet(idRange: range) { [weak self] (comments, errors) in
            self?.loaderHide()
            guard let comments = comments else {
                let errors = errors ?? ErrorsDict.init(error: NetworkErrorManager.serverError)
                self?.handleErrors(errors: errors)
                return
            }
            
            self?.isNextPage = comments.count == Limit.Network.PageSize.commentList // Last page was loaded with not full amount of comments
            
            self?.comments.append(contentsOf: comments)
            self?.commentsListView.tableView.reloadData()
        }
        self.loaderShow {
            request.cancel()
            self.loaderHide()
        }
    }
}


//MARK: init tableView

// MARK: - UITableViewDataSource

extension CommentsListViewController: UITableViewDataSource {
    
    private func initTableView() {
        commentsListView.tableView.register(ComentListCell.self, forCellReuseIdentifier: ComentListCell.cellId)
        commentsListView.tableView.dataSource = self
        commentsListView.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ComentListCell.cellId) as? ComentListCell {
            let comment = comments[indexPath.row]
            if comment == comments.last {
                self.loadNextPage()
            }
            cell.comment = comment
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension CommentsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
