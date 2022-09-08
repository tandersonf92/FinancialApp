//
//  ApiService.swift
//  FinancialApp
//
//  Created by Cora on 08/09/22.
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
    
    func fetchNormal(keywords: String, completion: @escaping (Result<SearchResults, ApiError>) -> Void) {
        
        guard let url = URL(string: "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keywords)&apikey=\(API_KEY)") else {
            return completion(.failure(.invalidURL))
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                return completion(.failure(.requestError(description: error.localizedDescription)))
            }
            
            guard let data = data else {
                return completion(.failure(.invalidData))
                
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(SearchResults.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.decodingError(description: error.localizedDescription)))
            }
        }
        dataTask.resume()

    }
}
