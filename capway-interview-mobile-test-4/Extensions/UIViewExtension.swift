//
//  UIViewExtension.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

// Extension functions to help simplify the definition of Autolayout constraints on views

extension UIView {
    
    enum sides {
        case top
        case leading
        case trailing
        case bottom
    }
    
    func anchorToSuperView() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
    
    func anchorToSuperView(on sides: [UIView.sides]) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        sides.forEach { side in
            switch side {
            case .top:
                self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            case .leading:
                self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            case .trailing:
                self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            }
        }
    }
}
