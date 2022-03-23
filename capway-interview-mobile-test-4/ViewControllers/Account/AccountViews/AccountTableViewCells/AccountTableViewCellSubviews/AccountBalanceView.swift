//
//  AccountBalanceView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

// Defines the portion of the top TableViewCell with the Account balance and pending charges

class AccountBalanceView: UIView {
    
    // Inject the Account model to display the current Account balance
    func updateBalance(for account: Account) {
        accountBalanceLabel.text = "$" + String(format: "%.2f", account.balance)
    }
    
    // Inject the Account model to display the total pending charges with the appropriate UI customizations based on the value
    func updatePendingCharges(for account: Account) {
        var total = 0.0
        account.transactions.forEach { transaction in
            if transaction.status == .pending {
                if transaction.direction == .credit {
                    total += transaction.amount
                } else {
                    total -= transaction.amount
                }
            }
        }
        var prefix = "$"
        // If pending charges are net positive, display with a + sign using green text
        if total > 0 {
            prefix = "+$"
            pendingChargesLabel.text = prefix + String(format: "%.2f", total)
            pendingChargesLabel.textColor = .systemGreen
        // If pending charges are net negative, display with a - sign using red text
        } else if total < 0 {
            prefix = "-$"
            pendingChargesLabel.text = prefix + String(format: "%.2f", abs(total))
            pendingChargesLabel.textColor = .systemRed
        // If pending charges are net zero, display with a no sign using gray text
        } else {
            pendingChargesLabel.text = prefix + String(format: "%.2f", total)
            pendingChargesLabel.textColor = UIColor(named: "text-gray")
        }
    }
    
    private let accountBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor(named: "text-dark-gray")
        return label
    }()
    
    private let accountBalanceCaption: UILabel = {
        let label = UILabel()
        label.text = "Account Balance"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "text-gray")
        return label
    }()
    
    private let pendingChargesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "text-gray")
        return label
    }()
    
    private let pendingChargesCaption: UILabel = {
        let label = UILabel()
        label.text = "Pending Charges"
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(named: "text-dark-gray")
        return label
    }()
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "light-gray")
        return line
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Autolayout accountBalanceLabel
        accountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        accountBalanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        // Autolayout accountBalanceCaption
        accountBalanceCaption.translatesAutoresizingMaskIntoConstraints = false
        accountBalanceCaption.topAnchor.constraint(equalTo: accountBalanceLabel.bottomAnchor, constant: 4).isActive = true
        accountBalanceCaption.leadingAnchor.constraint(equalTo: accountBalanceLabel.leadingAnchor).isActive = true
        // Autolayout pendingChargesCaption
        pendingChargesCaption.translatesAutoresizingMaskIntoConstraints = false
        pendingChargesCaption.topAnchor.constraint(equalTo: accountBalanceCaption.bottomAnchor, constant: 20).isActive = true
        pendingChargesCaption.leadingAnchor.constraint(equalTo: accountBalanceLabel.leadingAnchor).isActive = true
        pendingChargesCaption.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -10).isActive = true
        // Autolayout pendingChargesLabel
        pendingChargesLabel.translatesAutoresizingMaskIntoConstraints = false
        pendingChargesLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        pendingChargesLabel.centerYAnchor.constraint(equalTo: pendingChargesCaption.centerYAnchor).isActive = true
        // Autolayout separatorLine
        separatorLine.anchorToSuperView(on: [.leading, .trailing, .bottom])
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(accountBalanceLabel)
        addSubview(accountBalanceCaption)
        addSubview(pendingChargesCaption)
        addSubview(pendingChargesLabel)
        addSubview(separatorLine)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
