//
//  RESTRequestBuilder.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Alamofire
import Foundation

protocol RESTRequestBuilder {
    
    var baseURL: String { get }
    
    var apiVersion: ApiVersion { get }
    
    var path: String { get }

    var method: HTTPMethod { get }
    
    var headerParams: [String: String] { get }
        
    var queryParams: Parameters? { get }
    
    var bodyParams: Parameters? { get }
    
}

extension RESTRequestBuilder {
    
    var headerParams: [String: String] {
        return Self.defaultHeaders()
    }
    
    static func defaultHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": "Bearer \(AppConfiguration.apiKey)"]
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseUrlString = baseURL.appending(apiVersion.rawValue).appending(path)
        let url = try baseUrlString.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        var headers = [String: String]()
        headerParams.forEach { headers.updateValue($0.value, forKey: $0.key) }
        
        urlRequest.allHTTPHeaderFields = headers
    
        urlRequest = try JSONEncoding.default.encode(urlRequest, with: bodyParams)
        urlRequest = try URLEncoding(destination: .queryString, boolEncoding: .literal).encode(urlRequest, with: queryParams)
        
        return urlRequest
    }
    
}
