//
//  PriceClientProtocol.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

protocol PriceClientProtocol {
    
    func getPreviousClosePrice(_ name: String) async throws -> TickerPriceResponse
    
}
