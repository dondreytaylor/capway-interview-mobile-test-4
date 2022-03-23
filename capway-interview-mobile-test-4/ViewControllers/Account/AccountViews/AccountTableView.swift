//
//  AccountTableView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class AccountTableView: UITableView {
    
    func configure() {
        // Removes background highlighting when tapping in cells
        allowsSelection = false
        // Pinch the line separators in from the edge of the screen on both sides
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        // Hides the scroll indicator for a cleaner look
        showsVerticalScrollIndicator = false
        // Introduces pull-to-refresh functionality to the TableView
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString("Loading...")
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc private func refresh() {
        // Reload the data and refresh the TableView
        // DispatchQueue.main is required because we must use the main thread when making UI updates
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl?.beginRefreshing()
            self.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
