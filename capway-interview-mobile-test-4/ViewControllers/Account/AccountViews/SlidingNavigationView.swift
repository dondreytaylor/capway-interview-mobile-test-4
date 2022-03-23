//
//  SlidingNavigationView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

class SlidingNavigationView: UIView {
    
    // Closure used to pass the selected view information up to the view's parent ViewController
    var updateView: ((SelectedView) -> ())?
    
    // Definition of the possible states for the selected view
    enum SelectedView {
        case transactions
        case moneygoals
        case activity
        case statements
        case accountsettings
        case alerts
        case security
    }
    
    static let buttonWidth = 100
    static let buttonHeight = 26
    
    static func configure(_ button: UIButton) {
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.white, for: .selected)
        button.setTitleColor(UIColor(named: "text-dark-gray"), for: .normal)
        button.layer.cornerRadius = button.frame.size.height/2
        button.clipsToBounds = true
    }
    
    private let separatorLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "light-gray")
        return line
    }()
    
    private let scrollView: ControlContainableScrollView = {
        let scrollView = ControlContainableScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 14
        return stackView
    }()
    
    private let button1: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Transactions", for: .normal)
        button.backgroundColor = UIColor(named: "capway-blue")
        button.isSelected = true
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button1Tap), for: .touchUpInside)
        return button
    }()
    
    private let button2: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Money Goals", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button2Tap), for: .touchUpInside)
        return button
    }()
    
    private let button3: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Activity", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button3Tap), for: .touchUpInside)
        return button
    }()
    
    private let button4: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Statements", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button4Tap), for: .touchUpInside)
        return button
    }()
    
    private let button5: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Account Settings", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button5Tap), for: .touchUpInside)
        return button
    }()
    
    private let button6: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Alerts", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button6Tap), for: .touchUpInside)
        return button
    }()
    
    private let button7: PaddedButton = {
        let button = PaddedButton(frame: CGRect(x: 0, y: 0, width: SlidingNavigationView.buttonWidth, height: SlidingNavigationView.buttonHeight))
        button.setTitle("Security", for: .normal)
        button.isSelected = false
        SlidingNavigationView.configure(button)
        button.addTarget(self, action: #selector(button7Tap), for: .touchUpInside)
        return button
    }()
    
    @objc private func button1Tap() {
        if !button1.isSelected {
            button1.isSelected = true
            button1.backgroundColor = UIColor(named: "capway-blue")
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.transactions)
        }
    }
    
    @objc private func button2Tap() {
        if !button2.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = true
            button2.backgroundColor = UIColor(named: "capway-blue")
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.moneygoals)
        }
    }
    
    @objc private func button3Tap() {
        if !button3.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = true
            button3.backgroundColor = UIColor(named: "capway-blue")
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.activity)
        }
    }
    
    @objc private func button4Tap() {
        if !button4.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = true
            button4.backgroundColor = UIColor(named: "capway-blue")
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.statements)
        }
    }
    
    @objc private func button5Tap() {
        if !button5.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = true
            button5.backgroundColor = UIColor(named: "capway-blue")
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.accountsettings)
        }
    }
    
    @objc private func button6Tap() {
        if !button6.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = true
            button6.backgroundColor = UIColor(named: "capway-blue")
            button7.isSelected = false
            button7.backgroundColor = .clear
            updateView?(.alerts)
        }
    }
    
    @objc private func button7Tap() {
        if !button7.isSelected {
            button1.isSelected = false
            button1.backgroundColor = .clear
            button2.isSelected = false
            button2.backgroundColor = .clear
            button3.isSelected = false
            button3.backgroundColor = .clear
            button4.isSelected = false
            button4.backgroundColor = .clear
            button5.isSelected = false
            button5.backgroundColor = .clear
            button6.isSelected = false
            button6.backgroundColor = .clear
            button7.isSelected = true
            button7.backgroundColor = UIColor(named: "capway-blue")
            updateView?(.security)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        separatorLine.anchorToSuperView(on: [.top, .leading, .trailing])
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        scrollView.anchorToSuperView()
        stackView.anchorToSuperView(on: [.top, .bottom])
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(separatorLine)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Custom ScollView class that allows the user to scroll even when their touch occurs within a button
final class ControlContainableScrollView: UIScrollView {

    override func touchesShouldCancel(in view: UIView) -> Bool {
        if view is UIControl
            && !(view is UITextInput)
            && !(view is UISlider)
            && !(view is UISwitch) {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
}

// Custom Button class that allows for easy addition of padding around the title
class PaddedButton : UIButton {
    
    override var intrinsicContentSize: CGSize {
       get {
           let baseSize = super.intrinsicContentSize
           return CGSize(width: baseSize.width + 24,
                         height: baseSize.height)
           }
    }
}
