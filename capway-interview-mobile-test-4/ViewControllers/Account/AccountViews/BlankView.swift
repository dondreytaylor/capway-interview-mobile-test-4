//
//  BlankView.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/23/22.
//

import UIKit

// An empty view used to demonstrate the functionality of the SlidingNavigationView

class BlankView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
