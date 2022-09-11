//
//  ApiService.swift
//  FinancialApp
//
//  Created by Anderson Oliveira on 08/09/22.
//
import Combine
import UIKit

enum ApiError: Error {
    //    case invalidURL
    //    case requestError(description: String)
    //    case invalidResponse
    //    case invalidData
    //    case decodingError(description: String)
    case encoding
    case badRequest
}

// REFATORAR A FUNCAO QUE ELE FEZ 2x , fazendo um Generics

private enum FunctionType {
    static let symbolSearch: String = "SYMBOL_SEARCH"
    static let timeSeriesMonthlyAdjusted: String = "TIME_SERIES_MONTHLY_ADJUSTED"
}

enum WithSearch: String {
    case symbol
    case keywords
}

struct APIService {
    
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    let keys = ["C79UOUFUB3WKOUEL", "GRM191MMY2SSW1G0", "TPHI0YS53LSVK5ML"]
    
    func fetchSymbolsPublisher(keywords: String) -> AnyPublisher<SearchResults, Error > {
        fetchData(keywords: keywords, functionType: FunctionType.symbolSearch, withSearch: .keywords)
    }
    
    func fetchTimeSeriesMonthlyAdjusterPubliser(keywords: String) -> AnyPublisher<TimeSeriesMonthlyAdjusted, Error> {
        fetchData(keywords: keywords, functionType: FunctionType.timeSeriesMonthlyAdjusted, withSearch: .symbol)
    }
    
    func fetchData<T: Decodable> (keywords: String, functionType: String, withSearch: WithSearch) -> AnyPublisher<T, Error> {
        
        let result = parseQuery(text: keywords)
        var symbol = String()
        
        switch result {
        case .success(let query):
            symbol = query
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        let urlString = "https://www.alphavantage.co/query?function=\(functionType)&\(withSearch)=\(symbol)&apikey=\(API_KEY)"
        let urlResult = parseURL(urlString: urlString)
        
        switch urlResult {
        case .success(let url):
            return URLSession.shared.dataTaskPublisher(for: url)
                .map( {$0.data })
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        case .failure(let error):
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    private func parseQuery(text: String) -> Result<String, Error> {
        
        if let query = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            return .success(query)
        } else {
            return .failure(ApiError.encoding)
        }
    }
    
    private func parseURL(urlString: String) -> Result<URL, Error> {
        
        if let url = URL(string: urlString) {
            return .success(url)
        } else {
            return .failure(ApiError.badRequest)
        }
    }
}
