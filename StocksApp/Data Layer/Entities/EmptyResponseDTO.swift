//
//  EmptyResponseDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct EmptyResponseDTO: DomainMapped {
    
    func toDomain() -> EmptyResponse {
        EmptyResponse()
    }
    
}
