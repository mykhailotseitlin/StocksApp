//
//  TickerDetailsResponseDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickerDetailsResponseDTO: DomainMapped {
    
    let requestID: String
    let results: TickerDTO
    let status: String
    
    func toDomain() -> TickerDetailsResponse {
        TickerDetailsResponse(ticker: results.toDomain())
    }
    
}
