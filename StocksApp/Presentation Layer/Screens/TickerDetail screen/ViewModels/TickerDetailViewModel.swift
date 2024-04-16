//
//  TickerDetailViewModel.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 15.04.2024.
//

import Factory
import Foundation

final class TickerDetailViewModel: BaseViewModel {
    
    @Published var ticker: Ticker
    
    @Injected(\.priceClient) private var priceClient
    
    init(ticker: Ticker) {
        self.ticker = ticker
    }
    
    @MainActor func loadData() async {
        do {
            let priceResponse = try await priceClient.getPreviousClosePrice(ticker.symbol)
            guard let price = priceResponse.prices.first else { return }
            ticker.updatePrice(price)
        } catch let error as BaseError {
            showAlert(message: error.message)
        } catch {
            showAlert(message: error.localizedDescription)
        }
    }
    
}
