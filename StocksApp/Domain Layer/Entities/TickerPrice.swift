//
//  TickerPrice.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickerPrice {
    
    let closed: Double
    let open: Double
    
    var dailyChange: Double {
        closed - open
    }
    
    var dailyChangePercent: Double {
        (dailyChange / open) * 100
    }
    
}
