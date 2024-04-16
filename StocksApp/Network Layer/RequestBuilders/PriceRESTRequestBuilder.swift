//
//  PriceRESTRequestBuilder.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 15.04.2024.
//

import Alamofire
import Foundation

enum PriceRESTRequestBuilder: RESTRequestBuilder {
    
    case getPreviousClosePrice(String)
    
    var baseURL: String {
        return AppConfiguration.baseTickersURL
    }
    
    var apiVersion: ApiVersion {
        return .v2
    }
    
    var path: String {
        switch self {
        case let .getPreviousClosePrice(name):
            return "/aggs/ticker/\(name)/prev"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPreviousClosePrice:
            return .get
        }
    }
    
    var queryParams: Parameters? {
        switch self {
        case .getPreviousClosePrice:
            return nil
        }
    }
    
    var bodyParams: Parameters? {
        switch self {
        case .getPreviousClosePrice:
            return nil
        }
    }
    
}
