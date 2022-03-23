//
//  Transaction.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import Foundation

// Defines all of the data related to a single transaction

struct Transaction {
    
    enum Category {
        case bank
        case card
    }
    
    enum Direction {
        case credit
        case debit
    }
    
    enum Status {
        case approved
        case pending
        case canceled
    }
    
    let merchant: String
    let category: Category
    let amount: Double
    let direction: Direction
    let date: String
    let time: String
    var status: Status
}
