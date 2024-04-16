//
//  TickerType.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

enum TickerType: String, Decodable {
    
    case adrc = "ADRC"
    case cs = "CS"
    case etf = "ETF"
    case ets = "ETS"
    case fund = "FUND"
    case os = "OS"
    case pfd = "PFD"
    case unit = "UNIT"
    case warrant = "WARRANT"
    case other = "OTHER"
    
}
