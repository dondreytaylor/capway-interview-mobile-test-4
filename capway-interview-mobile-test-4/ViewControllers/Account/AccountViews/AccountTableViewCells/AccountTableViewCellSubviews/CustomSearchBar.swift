//
//  CustomSearchBar.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

// SearchBars in iOS 13+ cannot be customized to match the design spec
// So, I created a custom UITextField to mimic the functionality of a SearchBar, while also adhering to the design spec as closely as possible
// I did not implement filtering via search or the filter button in the rightView of the TextField

class CustomSearchBar: UITextField {
    
    private func configure() {
        isUserInteractionEnabled = false
        placeholder = "Search"
        attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor : UIColor(named: "text-gray") ?? .systemGray, .font : UIFont.systemFont(ofSize: 13, weight: .semibold)])
        setLeftIcon(UIImage(named: "search")!.withRenderingMode(.alwaysOriginal))
        setRightIcon(UIImage(named: "filter")!.withRenderingMode(.alwaysOriginal))
        font = .systemFont(ofSize: 13, weight: .regular)
        textColor = UIColor(named: "text-dark-dark-gray")
        tintColor = .systemGray
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "light-gray")?.cgColor
        layer.cornerRadius = frame.size.height/2
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 35))
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
