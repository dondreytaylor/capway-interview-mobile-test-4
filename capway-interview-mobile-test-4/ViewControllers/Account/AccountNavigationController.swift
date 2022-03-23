//
//  AccountNavigationController.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/20/22.
//

import UIKit

// Gives us the ability to add additional screens and navigation in the future
// Also provides the NavigationBar for the Account ViewController

class AccountNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add Account ViewController as the root of the navigation stack
        let vc = AccountViewController()
        viewControllers = [vc]
    }
}
