//
//  TransactionTableViewCell.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    // Prevent potential String mismatch when specifying the reuseIdentifier for this TableView cell
    static let reuseIdentifier = "transactionCell"
    
    // Inject the Account model into each view to display the data
    func configure(with model: Transaction) {
        categoryIcon.image = model.category == .bank ? UIImage(named: "bank")?.withRenderingMode(.alwaysOriginal) : UIImage(named: "card")?.withRenderingMode(.alwaysOriginal)
        merchantLabel.text = model.merchant
        dateAndTimeLabel.text = "\(model.date) at \(model.time)"
        amountLabel.text = model.direction == .credit ? "+$" + String(format: "%.2f", model.amount) : "-$" + String(format: "%.2f", model.amount)
        amountLabel.textColor = model.direction == .credit ? .systemGreen : .systemRed
        statusLabel.text = model.status == .pending ? "Pending" : ""
    }
    
    private let categoryIcon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        return icon
    }()
    
    private let merchantLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor(named: "text-dark-gray")
        return label
    }()
    
    private let dateAndTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(named: "text-gray")
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .right
        label.textColor = UIColor(named: "text-gray")
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Autolayout categoryIcon
        categoryIcon.translatesAutoresizingMaskIntoConstraints = false
        categoryIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        categoryIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        categoryIcon.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3).isActive = true
        // Autolayout merchantLabel
        merchantLabel.translatesAutoresizingMaskIntoConstraints = false
        merchantLabel.leadingAnchor.constraint(equalTo: categoryIcon.trailingAnchor, constant: 14).isActive = true
        merchantLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 2).isActive = true
        // Autolayout dateAndTimeLabel
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        dateAndTimeLabel.leadingAnchor.constraint(equalTo: merchantLabel.leadingAnchor).isActive = true
        dateAndTimeLabel.topAnchor.constraint(equalTo: merchantLabel.bottomAnchor, constant: 6).isActive = true
        // Autolayout amountLabel
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: merchantLabel.bottomAnchor, constant: 1).isActive = true
        // Autolayout statusLabel
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: dateAndTimeLabel.topAnchor, constant: -1).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: amountLabel.trailingAnchor).isActive = true
    }
    
    // Good practice to deallocate prior to reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryIcon.image = nil
        merchantLabel.text = nil
        dateAndTimeLabel.text = nil
        amountLabel.text = nil
        statusLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(categoryIcon)
        contentView.addSubview(merchantLabel)
        contentView.addSubview(dateAndTimeLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
