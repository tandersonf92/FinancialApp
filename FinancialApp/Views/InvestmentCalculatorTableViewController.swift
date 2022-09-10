//
//  InvestmentCalculatorTableViewController.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 10/09/22.
//

import UIKit

final class InvestmentCalculatorTableViewController: UITableViewController, ViewConfiguration {
    
    static let identifier = "InvestmentCalculator"
    
    var printzin: String
    
    init(style: UITableView.Style, printzin: String) {
         self.printzin = printzin
         super.init(style: style)
        tableView.register(CalculatorCell.self, forCellReuseIdentifier: CalculatorCell.identifier)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    
    private func setupNavigationBar() {
//        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.separatorStyle = .none
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FLASHEEEEI")
        setupNavigationBar()
    }

    func configViews() {
        
    }
    
    func buildViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
}


//extension InvestmentCalculatorTableViewController {
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        2
//    }
//    
//    
//}
