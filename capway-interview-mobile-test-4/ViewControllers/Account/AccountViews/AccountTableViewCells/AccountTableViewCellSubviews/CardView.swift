//
//  CardView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

// Defines the portion of the top TableViewCell with the card name, image, and status

class CardView: UIView {
    
    // Inject the Account model into each view to display the data
    func update(for account: Account) {
        cardNameCaption.text = account.name
        cardImageView.image = UIImage(named: account.imageUrl)
        cardStatusLabel.text = "Card \(account.number) is \(account.status.rawValue)"
    }
    
    private let cardNameCaption: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = UIColor(named: "text-dark-dark-gray")
        return label
    }()
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cardStatusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(named: "text-dark-gray")
        return label
    }()
    
    private let virtualCardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Virtual Card", for: .normal)
        button.setTitleColor(UIColor(named: "capway-blue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    private let dotSeparator: UIView = {
        let dot = UIView(frame: CGRect(x: 0, y: 0, width: 3, height: 3))
        dot.backgroundColor = UIColor(named: "medium-gray")
        dot.layer.cornerRadius = dot.frame.size.width / 2
        dot.clipsToBounds = true
        return dot
    }()
    
    private let addFundsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Funds", for: .normal)
        button.setTitleColor(UIColor(named: "capway-blue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Autolayout cardNameCaption
        cardNameCaption.translatesAutoresizingMaskIntoConstraints = false
        cardNameCaption.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        cardNameCaption.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        // Autolayout cardImageView
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.topAnchor.constraint(equalTo: cardNameCaption.bottomAnchor, constant: -6).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -14).isActive = true
        cardImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        cardImageView.widthAnchor.constraint(equalToConstant: 98*1.3945).isActive = true
        cardImageView.heightAnchor.constraint(equalToConstant: 98).isActive = true
        // Autolayout cardStatusLabel
        cardStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        cardStatusLabel.topAnchor.constraint(equalTo: cardImageView.topAnchor, constant: 17).isActive = true
        cardStatusLabel.leadingAnchor.constraint(equalTo: cardImageView.trailingAnchor, constant: 4).isActive = true
        // Autolayout virtualCardButton
        virtualCardButton.translatesAutoresizingMaskIntoConstraints = false
        virtualCardButton.topAnchor.constraint(equalTo: cardStatusLabel.bottomAnchor, constant: 3).isActive = true
        virtualCardButton.leadingAnchor.constraint(equalTo: cardStatusLabel.leadingAnchor).isActive = true
        // Autolayout dotSeparator
        dotSeparator.translatesAutoresizingMaskIntoConstraints = false
        dotSeparator.leadingAnchor.constraint(equalTo: virtualCardButton.trailingAnchor, constant: 5).isActive = true
        dotSeparator.centerYAnchor.constraint(equalTo: virtualCardButton.centerYAnchor).isActive = true
        dotSeparator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        dotSeparator.widthAnchor.constraint(equalToConstant: 3).isActive = true
        // Autolayout addFundsButton
        addFundsButton.translatesAutoresizingMaskIntoConstraints = false
        addFundsButton.leadingAnchor.constraint(equalTo: dotSeparator.trailingAnchor, constant: 5).isActive = true
        addFundsButton.centerYAnchor.constraint(equalTo: virtualCardButton.centerYAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardNameCaption)
        addSubview(cardImageView)
        addSubview(cardStatusLabel)
        addSubview(virtualCardButton)
        addSubview(dotSeparator)
        addSubview(addFundsButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
