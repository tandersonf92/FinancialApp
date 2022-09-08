//
//  SearchTableViewController.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//

import UIKit

final class SearchTableViewController: UITableViewController {

    private lazy var searchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Enter a company name or symbol"
        searchController.searchBar.autocapitalizationType = .allCharacters
        return searchController
    }()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        tableView.register(CompanyAssetCell.self, forCellReuseIdentifier: CompanyAssetCell.identifier)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        setupNavigationBar()
        
    }

    private func setupNavigationBar() {
        navigationItem.searchController = searchController
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyAssetCell.identifier, for: indexPath) as! CompanyAssetCell
        return cell
    }
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print("TEXT: \(text)")
    }
}
