//
//  TickerClientProtocol.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

protocol TickerClientProtocol {
    
    func getTickers() async throws -> TickersResponse
    func getTickerDetails(_ name: String) async throws -> TickerDetailsResponse
    func searchTickers(_ searchText: String) async throws -> TickersResponse
    
}
