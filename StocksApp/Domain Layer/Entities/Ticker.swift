//
//  Ticker.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct Ticker: Codable {
    
    let symbol: String
    let name: String
    var currentPrice: Double
    var dailyChange: Double
    var dailyChangePercent: Double
    
    mutating func updatePrice(_ price: TickerPrice) {
        currentPrice = price.closed
        dailyChange = price.dailyChange
        dailyChangePercent = price.dailyChangePercent
    }
    
}

extension Ticker {
    
    static let mock = Ticker(symbol: "ABC", name: "ABC edition", currentPrice: 123, dailyChange: -1, dailyChangePercent: 0.12)
    
}

extension Ticker: Identifiable {
    
    var id: String {
        return symbol
    }
    
}
