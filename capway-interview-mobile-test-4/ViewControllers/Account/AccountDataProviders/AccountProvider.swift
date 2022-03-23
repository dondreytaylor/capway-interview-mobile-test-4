//
//  AccountProvider.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/22/22.
//

import Foundation

// Object responsible for providing Account data to the AccountViewController
// In a real-world scenario, this object would likely make a network call to retrieve this data from a backend
// For this example, we will generate the data locally

class AccountProvider {
    
    // Gives the AccountProvider an object that can fetch transactions associated with the account
    let transactionProvider = TransactionProvider()
    
    func createAccount() -> Account {
        
        return Account(name: "CapWay Card",
                       imageUrl: "capway-debit-card",
                       number: "2881",
                       balance: 255.73,
                       status: .inactive,
                       transactions: transactionProvider.create10Transactions())
    }
}
