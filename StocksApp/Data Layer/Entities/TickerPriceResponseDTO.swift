//
//  TickerPriceResponseDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickerPriceResponseDTO: DomainMapped {
    
    let ticker: String
    let queryCount, resultsCount: Int
    let adjusted: Bool
    let results: [TickerPriceDTO]?
    let status, requestID: String
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case ticker, queryCount, resultsCount, adjusted, results, status
        case requestID = "request_id"
        case count
    }
    
    func toDomain() -> TickerPriceResponse {
        let result = results ?? []
        return TickerPriceResponse(prices: result.map { $0.toDomain() })
    }
    
}
