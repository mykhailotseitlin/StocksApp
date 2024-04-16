//
//  TickersRESTRequestBuilder.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Alamofire
import Foundation

enum TickersRESTRequestBuilder: RESTRequestBuilder {
    
    case getTickers
    case getTickerDetails(String)
    case searchTickers(String)
    
    var baseURL: String {
        return AppConfiguration.baseTickersURL
    }
    
    var apiVersion: ApiVersion {
        return .v3
    }
    
    var path: String {
        switch self {
        case .getTickers, .searchTickers:
            return "/reference/tickers"
        case let .getTickerDetails(name):
            return "/reference/tickers/\(name)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getTickers, .getTickerDetails, .searchTickers:
            return .get
        }
    }
    
    var queryParams: Parameters? {
        switch self {
        case .getTickers, .getTickerDetails:
            return nil
        case let .searchTickers(searchText):
            return ["search": searchText]
        }
    }
    
    var bodyParams: Parameters? {
        switch self {
        case .getTickers, .getTickerDetails, .searchTickers:
            return nil
        }
    }
    
}
