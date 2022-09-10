//
//  ApiService.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//
import Combine
import UIKit

enum ApiError: Error {
    case invalidURL
    case requestError(description: String)
    case invalidResponse
    case invalidData
    case decodingError(description: String)
}

struct APIService {
    
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    let keys = ["C79UOUFUB3WKOUEL", "GRM191MMY2SSW1G0", "TPHI0YS53LSVK5ML"]
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error > {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)"
        
        let url = URL(string: urlString)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map( {$0.data })
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
