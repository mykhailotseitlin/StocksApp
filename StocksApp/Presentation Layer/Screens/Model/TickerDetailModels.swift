//
//  TickerDetailModels.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

enum TickerDetailModels {
    
    struct ChartContent {
        
        var data: [Double] = []
        var range: ClosedRange<Double> {
            let minValue = data.min() ?? 0.0
            let maxValue = data.max() ?? 0.0
            return minValue...maxValue
        }
        
    }
    
}
