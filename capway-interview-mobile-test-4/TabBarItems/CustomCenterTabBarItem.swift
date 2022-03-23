//
//  CustomCenterTabBarItem.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import UIKit

class CustomCenterTabBarItem: UITabBarItem {
    
    // String to help build the asset name used in the UIImage
    private let prefix = "tab_"
    
    // Whether or not the TabBarItem is selected determines which asset is displayed
    enum state: String {
        case inactive = "_inactive"
        case active = "_active"
    }
    
    // Empty function required to allow the forEach call in the MainTabBarController
    // If this is not defined, the compiler throws an error because the common superclass of this class and the CustomTabBarItem class - i.e. TabBarItem - does not have an adjustAlignment() function
    func adjustAlignment() {}
    
    init(title: String) {
        super.init(title: nil,
                   image: UIImage(named: prefix + title.lowercased() + state.inactive.rawValue)?.withRenderingMode(.alwaysOriginal),
                   selectedImage: UIImage(named: prefix + title.lowercased() + state.active.rawValue)?.withRenderingMode(.alwaysOriginal))
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
