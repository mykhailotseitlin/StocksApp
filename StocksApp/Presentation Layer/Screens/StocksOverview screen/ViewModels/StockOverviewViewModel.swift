//
//  StockOverviewViewModel.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Factory
import Foundation

class BaseViewModel: ObservableObject {
    
    @Published var showingAlert: Bool = false
    @Published var alertContent = AlertContent()
    
    func showAlert(title: String = "Error", message: String) {
        showingAlert = true
        alertContent = AlertContent(title: "Error", message: message)
    }
    
}

final class StockOverviewViewModel: BaseViewModel {
    
    @Published var tickers: [Ticker] = []
    
    @Injected(\.tickerClient) private var tickerClient
    
    @MainActor func fetchStocks() async {
        do {
            let tickersResponse = try await tickerClient.getTickers()
            self.tickers = tickersResponse.tickers
        } catch let error as BaseError {
            showAlert(message: error.message)
        } catch {
            showAlert(message: error.localizedDescription)
        }
    }
    
}
