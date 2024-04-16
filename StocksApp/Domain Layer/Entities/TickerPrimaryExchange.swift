//
//  TickerPrimaryExchange.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

enum TickerPrimaryExchange: String, Decodable {
    
    case arcx = "ARCX"
    case bats = "BATS"
    case xase = "XASE"
    case xnas = "XNAS"
    case xnys = "XNYS"
    case other
    
}
