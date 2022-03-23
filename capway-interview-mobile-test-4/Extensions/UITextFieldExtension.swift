//
//  UITextFieldExtension.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import UIKit

// Extension functions that make it easier to add padding to the left and right views of a UITextField

extension UITextField {

    func setLeftIcon(_ icon: UIImage) {

        let leftPadding = 16
        let rightPadding = 10
        let size = 15

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size + leftPadding + rightPadding, height: size))
        let iconView  = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)

        leftView = outerView
        leftViewMode = .always
    }
    
    func setRightIcon(_ icon: UIImage) {

        let padding = 16
        let size = 15

        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size + padding, height: size))
        let iconView  = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)

        rightView = outerView
        rightViewMode = .always
    }
}
