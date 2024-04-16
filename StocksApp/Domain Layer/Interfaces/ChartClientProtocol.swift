//
//  ChartClientProtocol.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

protocol ChartClientProtocol {
    
    func getAggregateBars(name: String, fromDate: String, toDate: String) async throws -> TickerPriceResponse

}
