//
//  Account.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import Foundation

// Defines all of the data related to a CapWay debit card account

struct Account {
    
    enum Status: String {
        case active = "active"
        case inactive = "inactive"
    }
    
    let name: String
    let imageUrl: String
    let number: String
    var balance: Double
    var status: Status
    var transactions: [Transaction]
}
