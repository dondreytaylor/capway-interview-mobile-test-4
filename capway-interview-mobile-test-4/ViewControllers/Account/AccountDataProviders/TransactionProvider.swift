//
//  TransactionProvider.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/21/22.
//

import Foundation

// Object responsible for providing Transaction data to the AccountProvider
// In a real-world scenario, this object would likely make a network call to retrieve this data from a backend
// For this example, we will generate the data locally

class TransactionProvider {
    
    func create10Transactions() -> [Transaction] {
        
        return [Transaction(merchant: "Dominos",
                            category: .card,
                            amount: 2.00,
                            direction: .debit,
                            date: "12/13/2021",
                            time: "07:35 PM",
                            status: .approved),
                Transaction(merchant: "Deposit from bank",
                            category: .bank,
                            amount: 25.00,
                            direction: .credit,
                            date: "12/07/2021",
                            time: "06:00 PM",
                            status: .pending),
                Transaction(merchant: "Deposit from bank",
                            category: .bank,
                            amount: 100.00,
                            direction: .credit,
                            date: "07/29/2021",
                            time: "11:44 AM",
                            status: .pending),
                Transaction(merchant: "Deposit from bank",
                            category: .bank,
                            amount: 5.00,
                            direction: .credit,
                            date: "06/24/2021",
                            time: "02:37 PM",
                            status: .pending),
                Transaction(merchant: "Macy's Store 323",
                            category: .card,
                            amount: 38.12,
                            direction: .debit,
                            date: "06/22/2021",
                            time: "05:49 PM",
                            status: .approved),
                Transaction(merchant: "McDonald's",
                            category: .card,
                            amount: 9.34,
                            direction: .debit,
                            date: "06/19/2021",
                            time: "07:23 AM",
                            status: .approved),
                Transaction(merchant: "Withdrawal from bank",
                            category: .bank,
                            amount: 130.00,
                            direction: .debit,
                            date: "05/30/2021",
                            time: "12:12 PM",
                            status: .pending),
                Transaction(merchant: "Starbucks",
                            category: .card,
                            amount: 4.17,
                            direction: .debit,
                            date: "05/28/2021",
                            time: "08:27 AM",
                            status: .approved),
                Transaction(merchant: "Deposit from bank",
                            category: .bank,
                            amount: 75.00,
                            direction: .credit,
                            date: "05/17/2021",
                            time: "03:32 PM",
                            status: .approved),
                Transaction(merchant: "Chipotle",
                            category: .card,
                            amount: 9.09,
                            direction: .debit,
                            date: "05/08/2021",
                            time: "06:44 PM",
                            status: .approved)]
    }
}
