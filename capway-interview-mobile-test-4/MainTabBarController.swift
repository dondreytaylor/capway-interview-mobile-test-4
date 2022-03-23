//
//  MainTabBarController.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/20/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure UI elements
        view.backgroundColor = .systemBackground
        configureTabBar()
        
        // Grant the controller the ability to determine which tab is selected
        delegate = self
        
        // Instantiate ViewControllers
        let viewControllers = [AccountNavigationController(),
                               SendViewController(),
                               MoreViewController(),
                               LearnViewController(),
                               PhundsViewController()]
        
        // Create TabBarItems
        let tabBarItems = generateTabBarItems()
        
        // Assign TabBarItems to ViewControllers
        for i in 0..<viewControllers.count {
            viewControllers[i].tabBarItem = tabBarItems[i]
        }
        
        // Assign ViewControllers to the TabBarController
        // Now selecting each TabBarItem will navigate to a distinct ViewController
        setViewControllers(viewControllers, animated: false)
    }
    
    private func configureTabBar() {
        // Configure TabBar appearance
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(named: "capway-blue")
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor(named: "text-dark-gray")?.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    
    private func generateTabBarItems() -> [UITabBarItem] {
        // Create an array of the 5 TabBarItems to be displayed in the TabBar
        // The center item is of a different class than the others because it has unique properties
        let tabBarItems = [CustomTabBarItem(type: .account),
                           CustomTabBarItem(type: .send),
                           CustomCenterTabBarItem(title: "More"),
                           CustomTabBarItem(type: .learn),
                           CustomTabBarItem(type: .phunds)
        ]
        // The spacing between the image and text in the asset used for the center TabBarItem does not match the default spacing of the other TabBarItems
        // This adjusts the alignment of the other four TabBarItems to line them up with the center one
        tabBarItems.forEach { item in
            if let item = item as? CustomTabBarItem {
                item.adjustAlignment()
            }
        }
        return tabBarItems
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        return true
    }
}
