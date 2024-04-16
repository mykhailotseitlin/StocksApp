//
//  TickersResponseDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickersResponseDTO: DomainMapped {
    
    let results: [TickerDTO]
    let status: String
    let requestID: String
    let count: Int?
    let nextURL: String?
    
    enum CodingKeys: String, CodingKey {
        case results, status
        case requestID = "request_id"
        case count
        case nextURL = "next_url"
    }
    
    func toDomain() -> TickersResponse {
        TickersResponse(tickers: results.map { $0.toDomain() })
    }
    
}
