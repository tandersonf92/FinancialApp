//
//  SearchTableViewController.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//

import UIKit
import Combine

final class SearchTableViewController: UITableViewController, UIAnimatable {
    
    private enum Mode {
        case onboarding
        case search
    }
    
    private let apiService = APIService()
    private var subscribers = Set<AnyCancellable>()
    private var searchResults: SearchResults?
    @Published private var mode: Mode = .onboarding
    @Published private var searchQuery = String()
    
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
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        setupNavigationBar()
        setupTableView() // para remover as linhas da tableView no onboarding
        observeForm()
    }
    
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true // olhar. pois a navController esta nil
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
    }
    
    private func observeForm() {
        $searchQuery
            .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
            .sink { [unowned self](searchQuery) in
                guard !searchQuery.isEmpty else { return }
                showLoadingAnimation()
                self.apiService.fetchSymbolsPublisher(keywords: searchQuery).sink { (completion) in
                    self.hideLoadingAnimation()
                    switch completion {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .finished: break
                    }
                } receiveValue: { (searchResults) in
                    self.searchResults = searchResults
                    self.tableView.reloadData()
                }.store(in: &self.subscribers)
            }.store(in: &subscribers)
        
        $mode.sink { [unowned self] (mode) in
            switch mode {
            case .onboarding:
                tableView.backgroundView = SearchPlaceholderComponentView()
            case .search:
                tableView.backgroundView = nil
            }
        }.store(in:&subscribers)
    }
}

extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompanyAssetCell.identifier, for: indexPath) as! CompanyAssetCell
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.row]
            cell.configure(with: searchResult)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let searchResults = self.searchResults {
            let searchResult = searchResults.items[indexPath.item]
            let symbol = searchResult.symbol
            print(symbol)
            handleSelection(for: symbol, searchResult: searchResult)
        }
    }
    
    private func handleSelection(for symbol: String, searchResult: SearchResult) {
        showLoadingAnimation()
        apiService.fetchTimeSeriesMonthlyAdjusterPubliser(keywords: symbol).sink { [weak self] (completionResult) in
            self?.hideLoadingAnimation()
            switch completionResult {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        } receiveValue: { [weak self] (timeSeriesMonthlyAdjusted) in
            self?.hideLoadingAnimation()
            let asset = Asset(searchResult: searchResult, timeSeriesMonthlyAdjusted: timeSeriesMonthlyAdjusted)
            self?.navigationController?.pushViewController(InvestmentCalculatorViewController(asset: asset), animated: true)
            
            print("Success: \(timeSeriesMonthlyAdjusted)")
        }.store(in: &subscribers)
        
    }
    
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchQuery = searchController.searchBar.text,
              !searchQuery.isEmpty else { return }
        self.searchQuery = searchQuery
    }
    func willPresentSearchController(_ searchController: UISearchController) { // vai servir para mudar o Mode ( sair do onboarding )
        mode = .search
    }
}
