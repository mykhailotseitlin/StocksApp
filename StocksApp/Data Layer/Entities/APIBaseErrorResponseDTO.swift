//
//  APIBaseErrorResponseDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct APIBaseErrorResponseDTO: DomainMapped, Error {
    
    let status: String
    let requestID: String
    let error: String

    enum CodingKeys: String, CodingKey {
        case status
        case requestID = "request_id"
        case error
    }
    
    func toDomain() -> BaseError {
        return BaseError(message: error, kind: .major)
    }
    
}
