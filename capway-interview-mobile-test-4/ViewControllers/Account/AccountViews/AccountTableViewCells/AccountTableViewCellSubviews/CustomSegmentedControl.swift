//
//  CustomSegmentedControl.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

// SegmentedControls in iOS 13+ cannot be customized to match the design spec
// So, I created a custom view comprised of 3 toggle buttons to mimic the functionality of a SegmentedControl, while also adhering to the design spec as closely as possible
// I did not implement a sliding animation for the selection indicator, but opted for a show/hide approach

class CustomSegmentedControl: UIView {
    
    // Closure used to pass the selection information up to the view's parent ViewController
    var updateFilterState: ((Selection) -> ())?
    
    // Definition of the possible states for the filter selection
    enum Selection {
        case transactions
        case deposits
        case withdrawals
    }
    
    private let transactionsButton: UIButton = {
        let button = UIButton()
        button.isSelected = true
        button.setTitle("Transactions", for: .normal)
        button.setTitleColor(UIColor(named: "medium-gray"), for: .normal)
        button.setTitleColor(UIColor(named: "text-dark-dark-gray"), for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.addTarget(self, action: #selector(handleTransactionsTap), for: .touchUpInside)
        return button
    }()
    
    private let transactionsSelectionIndicator: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor(named: "capway-blue")
        bar.isHidden = false
        return bar
    }()
    
    private let depositsButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Deposits", for: .normal)
        button.setTitleColor(UIColor(named: "medium-gray"), for: .normal)
        button.setTitleColor(UIColor(named: "text-dark-gray"), for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.addTarget(self, action: #selector(handleDepositsTap), for: .touchUpInside)
        return button
    }()
    
    private let depositsSelectionIndicator: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor(named: "capway-blue")
        bar.isHidden = true
        return bar
    }()
    
    private let withdrawalsButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Withdrawals", for: .normal)
        button.setTitleColor(UIColor(named: "medium-gray"), for: .normal)
        button.setTitleColor(UIColor(named: "text-dark-gray"), for: .selected)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        button.addTarget(self, action: #selector(handleWithdrawalsTap), for: .touchUpInside)
        return button
    }()
    
    private let withdrawalsSelectionIndicator: UIView = {
        let bar = UIView()
        bar.backgroundColor = UIColor(named: "capway-blue")
        bar.isHidden = true
        return bar
    }()
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "light-gray")
        return line
    }()
    
    // Function called when the Transactions section is tapped
    @objc private func handleTransactionsTap() {
        if !transactionsButton.isSelected {
            transactionsButton.isSelected = true
            depositsButton.isSelected = false
            withdrawalsButton.isSelected = false
            transactionsSelectionIndicator.isHidden = false
            depositsSelectionIndicator.isHidden = true
            withdrawalsSelectionIndicator.isHidden = true
            // Pass the selection state to the closure so the parent ViewController can access it
            updateFilterState?(.transactions)
        }
    }
    
    // Function called when the Deposits section is tapped
    @objc private func handleDepositsTap(sender: UIButton) {
        if !depositsButton.isSelected {
            transactionsButton.isSelected = false
            depositsButton.isSelected = true
            withdrawalsButton.isSelected = false
            transactionsSelectionIndicator.isHidden = true
            depositsSelectionIndicator.isHidden = false
            withdrawalsSelectionIndicator.isHidden = true
            // Pass the selection state to the closure so the parent ViewController can access it
            updateFilterState?(.deposits)
        }
    }
    
    // Function called when the Withdrawals section is tapped
    @objc private func handleWithdrawalsTap(sender: UIButton) {
        if !withdrawalsButton.isSelected {
            transactionsButton.isSelected = false
            depositsButton.isSelected = false
            withdrawalsButton.isSelected = true
            transactionsSelectionIndicator.isHidden = true
            depositsSelectionIndicator.isHidden = true
            withdrawalsSelectionIndicator.isHidden = false
            // Pass the selection state to the closure so the parent ViewController can access it
            updateFilterState?(.withdrawals)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Autolayout transactionsButton
        transactionsButton.anchorToSuperView(on: [.top, .leading, .bottom])
        transactionsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        // Autolayout transactionsSelectionIndicator
        transactionsSelectionIndicator.anchorToSuperView(on: [.leading, .bottom])
        transactionsSelectionIndicator.widthAnchor.constraint(equalTo: transactionsButton.widthAnchor).isActive = true
        transactionsSelectionIndicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        // Autolayout depositsButton
        depositsButton.anchorToSuperView(on: [.top, .bottom])
        depositsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        depositsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        // Autolayout depositsSelectionIndicator
        depositsSelectionIndicator.anchorToSuperView(on: [.bottom])
        depositsSelectionIndicator.centerXAnchor.constraint(equalTo: depositsButton.centerXAnchor).isActive = true
        depositsSelectionIndicator.widthAnchor.constraint(equalTo: transactionsButton.widthAnchor).isActive = true
        depositsSelectionIndicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        // Autolayout withdrawalsButton
        withdrawalsButton.anchorToSuperView(on: [.top, .trailing, .bottom])
        withdrawalsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        // Autolayout withdrawalsSelectionIndicator
        withdrawalsSelectionIndicator.anchorToSuperView(on: [.trailing, .bottom])
        withdrawalsSelectionIndicator.widthAnchor.constraint(equalTo: withdrawalsButton.widthAnchor).isActive = true
        withdrawalsSelectionIndicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        // Autolayout separatorLine
        separatorLine.anchorToSuperView(on: [.leading, .trailing, .bottom])
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(transactionsButton)
        addSubview(depositsButton)
        addSubview(withdrawalsButton)
        addSubview(separatorLine)
        addSubview(transactionsSelectionIndicator)
        addSubview(depositsSelectionIndicator)
        addSubview(withdrawalsSelectionIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
