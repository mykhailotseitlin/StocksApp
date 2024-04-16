//
//  NetworkServiceProtocol.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Alamofire
import Foundation

protocol NetworkServiceProtocol {
    
    func responseModel<S: Decodable, F: DomainMapped & Error>(_ request: URLRequestConvertible,
                                                              successModel: S.Type,
                                                              failureModel: F.Type) async throws -> S
    
}

extension NetworkServiceProtocol {
    
    func responseModel<S: Decodable>(_ request: URLRequestConvertible, successModel: S.Type) async throws -> S {
        try await responseModel(request, successModel: successModel, failureModel: APIBaseErrorResponseDTO.self)
    }
    
}
