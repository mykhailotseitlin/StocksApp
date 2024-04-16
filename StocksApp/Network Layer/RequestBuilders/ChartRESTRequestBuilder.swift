//
//  ChartRESTRequestBuilder.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Alamofire
import Foundation

enum ChartRESTRequestBuilder: RESTRequestBuilder {
    
    case getAggregateBars(name: String, fromDate: String, toDate: String)
    
    var baseURL: String {
        return AppConfiguration.baseTickersURL
    }
    
    var apiVersion: ApiVersion {
        return .v2
    }
    
    var path: String {
        switch self {
        case let .getAggregateBars(name, fromDate, toDate):
            return "/aggs/ticker/\(name)/range/1/day/\(fromDate)/\(toDate)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAggregateBars:
            return .get
        }
    }
    
    var queryParams: Parameters? {
        switch self {
        case .getAggregateBars:
            return nil
        }
    }
    
    var bodyParams: Parameters? {
        switch self {
        case .getAggregateBars:
            return nil
        }
    }
    
}
