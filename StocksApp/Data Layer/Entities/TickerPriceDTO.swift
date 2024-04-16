//
//  TickerPriceDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickerPriceDTO: DomainMapped {
    
    let ticker: String?
    let volume: Int
    let volumeWeighted: Double
    let open: Double
    let closed: Double
    let highest: Double
    let lowest: Double
    let timestamp: Int
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case ticker = "T"
        case volume = "v"
        case volumeWeighted = "vw"
        case open = "o"
        case closed = "c"
        case highest = "h"
        case lowest = "l"
        case timestamp = "t"
        case count = "n"
    }
    
    func toDomain() -> TickerPrice {
        TickerPrice(closed: closed, open: open)
    }
    
}
