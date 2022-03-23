//
//  CustomTabBarItem.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class CustomTabBarItem: UITabBarItem {
    
    // String to help build the asset name used in the UIImage
    private let prefix = "tab_"
    
    // Defines the four non-center TabBarItems
    enum type: String {
        case account = "Account"
        case send = "Send"
        case learn = "Learn"
        case phunds = "Phunds"
    }
    
    // Whether or not the TabBarItem is selected determines which asset is displayed
    enum state: String {
        case inactive = "_inactive"
        case active = "_active"
    }
    
    // Adjust the alignment of the text and image to match the asset used for the center TabBarItem
    func adjustAlignment() {
        imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 9)
    }
    
    init(type: CustomTabBarItem.type) {
        super.init(title: type.rawValue,
                   image: UIImage(named: prefix + type.rawValue.lowercased() + state.inactive.rawValue)?.withRenderingMode(.alwaysTemplate),
                   selectedImage: UIImage(named: prefix + type.rawValue.lowercased() + state.active.rawValue)?.withRenderingMode(.alwaysTemplate))
    }

    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
