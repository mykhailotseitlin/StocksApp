//
//  TickerRow.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import SwiftUI

struct TickerRow: View {
    
    let ticker: Ticker

    var body: some View {
        VStack(alignment: .leading) {
            Text(ticker.symbol)
                .font(.headline)
            Text(ticker.name)
                .font(.subheadline)
        }
    }
    
}

#Preview {
    TickerRow(ticker: .mock)
}
