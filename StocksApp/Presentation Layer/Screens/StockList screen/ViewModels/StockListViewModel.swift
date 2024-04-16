//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Factory
import Foundation

final class StockListViewModel: ObservableObject {
    
    @Published var tickers: [Ticker] = []
    
    @Injected(\.userDefaultsStorage) private var userDefaultsStorage

    func loadData() {
        let tickers: [Ticker] = userDefaultsStorage.load(forKey: "tickers") ?? []
        self.tickers = tickers
    }

    func deleteTicker(at index: IndexSet) {
        tickers.remove(atOffsets: index)
        _ = userDefaultsStorage.save(tickers, forKey: "tickers")
    }
    
}
