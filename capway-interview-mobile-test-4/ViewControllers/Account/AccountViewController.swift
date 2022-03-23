//
//  AccountViewController.swift
//  capway-interview-mobile-test-4
//
//  Created by Ryan Prince on 3/20/22.
//

import UIKit

class AccountViewController: UIViewController {
    
    // Model that holds the data to be displayed
    var account: Account!
    
    // Object responsible for providing the model to the controller
    let accountProvider = AccountProvider()
            
    // Array holding the subset of Transactions that are currently visible based on the selected filter
    var visibleTransactions: [Transaction]!
    
    // Keep a reference to the currently selected Transaction type to allow the TableView to accurately update when fetching new Transactions
    var visibleTransactionType: CustomSegmentedControl.Selection?
    
    // UI elements
    let slidingNavigationView = SlidingNavigationView()
    let tableView = AccountTableView()
    let blankView = BlankView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure UI elements
        view.backgroundColor = .systemBackground
        view.addSubview(slidingNavigationView)
        view.addSubview(tableView)
        view.addSubview(blankView)
        configureNavBar()
        configureSlidingNavigationView()
        configureTableView()
        configureBlankView()
        // Inject an example Account with the AccountProvider
        account = accountProvider.createAccount()
        // Initialize the visible transactions to all transactions
        visibleTransactions = account.transactions
    }
    
    private func configureNavBar() {
        // Configure NavigationBar appearance
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .systemBackground
        // Configure title appearance
        let titleLabel = UILabel()
        titleLabel.text = "Account"
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = UIColor(named: "text-dark-gray")
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        // Configure profile picture appearance
        let profileImageView = ProfileImageView(for: "profile")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    private func configureSlidingNavigationView() {
        // Configure SlidingNavigationView appearance
        slidingNavigationView.anchorToSuperView(on: [.top, .leading, .trailing])
        slidingNavigationView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        slidingNavigationView.updateView = { selectedView in
            self.updateVisibleView(basedOn: selectedView)
        }
    }
    
    private func configureTableView() {
        // Configure TableView appearance
        tableView.anchorToSuperView(on: [.leading, .trailing, .bottom])
        tableView.topAnchor.constraint(equalTo: slidingNavigationView.bottomAnchor).isActive = true
        tableView.configure()
        // Grant the controller permission to populate and manipulate the TableView
        tableView.dataSource = self
        tableView.delegate = self
        // Register both types of TableView cells - Account Cell and Transactions Cell
        tableView.register(AccountBalanceTableViewCell.self, forCellReuseIdentifier: AccountBalanceTableViewCell.reuseIdentifier)
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.reuseIdentifier)
    }
    
    private func configureBlankView() {
        // Configure BlankView layout
        blankView.anchorToSuperView(on: [.leading, .trailing, .bottom])
        blankView.topAnchor.constraint(equalTo: slidingNavigationView.bottomAnchor).isActive = true
        // Will be hidden initially because Transactions is the default selection in SlidingNavigationView
        blankView.isHidden = true
    }
    
    private func updateVisibleTransactions(basedOn selection: CustomSegmentedControl.Selection) {
        // Filter the visibleTransactions based on the selection made in the CustomSegmentedControl
        switch selection {
        case .transactions:
            visibleTransactions = account.transactions
        case .deposits:
            visibleTransactions = account.transactions.filter { $0.direction == .credit }
        case .withdrawals:
            visibleTransactions = account.transactions.filter { $0.direction == .debit }
        }
        // Animate the reloading of the TableView
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
    
    private func updateVisibleView(basedOn selection: SlidingNavigationView.SelectedView) {
        switch selection {
        case .transactions:
            tableView.isHidden = false
            blankView.isHidden = true
        default:
            tableView.isHidden = true
            blankView.isHidden = false
        }
    }
}

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Need one row per filtered transaction plus the one Account Cell
        return visibleTransactions.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // First row of the TableView will be the Account Cell
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountBalanceTableViewCell.reuseIdentifier,
                                                     for: indexPath) as? AccountBalanceTableViewCell else { return UITableViewCell() }
            // Remove the line separators from the top and bottom of the Account Cell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            // Inject the Account model and update the cell's appearance to display the data
            cell.configure(with: account)
            // Implement the updateFilterState closure defined in the CustomeSegmentedControl view
            // Use the closure to update the visibleTransactions array and reload the TableView
            cell.transactionFilterControl.updateFilterState = { selection in
                self.visibleTransactionType = selection
                self.updateVisibleTransactions(basedOn: selection)
            }
            return cell
        } else {
            // All other rows of the TableView will display data for one Transaction each
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.reuseIdentifier,
                                                     for: indexPath) as? TransactionTableViewCell else { return UITableViewCell() }
            // Inject the Transaction model and update the cell's appearance to display the data
            cell.configure(with: visibleTransactions[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Define the height of each cell type
        indexPath.row == 0 ? 350 : 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Fetch 10 new Transactions from the TransactionProvider when scroll reaches the bottom of the TableView
        if indexPath.row == visibleTransactions.count {
            let newlyFetchedTransactions = accountProvider.transactionProvider.create10Transactions()
            account.transactions.append(contentsOf: newlyFetchedTransactions)
            // Update the visible transactions array to reload the UI
            updateVisibleTransactions(basedOn: visibleTransactionType ?? .transactions)
        }
    }
}
