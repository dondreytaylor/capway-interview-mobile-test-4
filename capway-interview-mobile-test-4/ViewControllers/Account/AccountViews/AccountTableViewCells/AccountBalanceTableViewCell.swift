//
//  AccountBalanceTableViewCell.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class AccountBalanceTableViewCell: UITableViewCell {
    
    // Prevent potential String mismatch when specifying the reuseIdentifier for this TableView cell
    static let reuseIdentifier = "accountCell"
    
    // UI elements
    private let accountBalanceView = AccountBalanceView()
    private let cardView = CardView()
    // This element must be public because we need to reference it from the parent ViewController during filtering
    let transactionFilterControl = CustomSegmentedControl()
    private let transactionSearchBar = CustomSearchBar()
    
    // Inject the Account model into each view to display the data
    func configure(with model: Account) {
        accountBalanceView.updateBalance(for: model)
        accountBalanceView.updatePendingCharges(for: model)
        cardView.update(for: model)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Autolayout accountBalanceView
        accountBalanceView.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        accountBalanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        accountBalanceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        // Autolayout cardView
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.topAnchor.constraint(equalTo: accountBalanceView.bottomAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24).isActive = true
        // Autolayout transactionFilterControl
        transactionFilterControl.anchorToSuperView(on: [.leading, .trailing])
        transactionFilterControl.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -4).isActive = true
        transactionFilterControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // Autolayout transactionSearchBar
        transactionSearchBar.translatesAutoresizingMaskIntoConstraints = false
        transactionSearchBar.topAnchor.constraint(equalTo: transactionFilterControl.bottomAnchor, constant: 10).isActive = true
        transactionSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        transactionSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        transactionSearchBar.heightAnchor.constraint(equalToConstant: 35).isActive = true
        transactionSearchBar.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(accountBalanceView)
        contentView.addSubview(cardView)
        contentView.addSubview(transactionFilterControl)
        contentView.addSubview(transactionSearchBar)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
