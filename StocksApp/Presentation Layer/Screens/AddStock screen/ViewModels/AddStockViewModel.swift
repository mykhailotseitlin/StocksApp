//
//  AddStockViewModel.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import AsyncAlgorithms
import Factory
import Foundation

final class AddStockViewModel: BaseViewModel {
    
    @Published var searchText: String = ""
    @Published var tickers: [Ticker] = []
    
    private let delayDuration: Duration = .milliseconds(300)

    @Injected(\.tickerClient) private var tickerClient
    @Injected(\.userDefaultsStorage) private var userDefaultsStorage
    
    func saveTicker(_ ticker: Ticker) {
        var savedTickers: [Ticker] = userDefaultsStorage.load(forKey: "tickers") ?? []
        savedTickers.append(ticker)
        let isSuccess = userDefaultsStorage.save(savedTickers, forKey: "tickers")
        let title = isSuccess ? "Success" : "Error"
        let message = isSuccess ? "Data saved successfully!" : "Failed to save data."
        showAlert(title: title, message: message)
    }
    
    @MainActor func listenToSearchText() async {
        for await searchQuery in $searchText.values.debounce(for: delayDuration) {
            do {
                let searchResults = try await tickerClient.searchTickers(searchQuery)
                tickers = searchResults.tickers
            } catch let error as BaseError {
                showAlert(message: error.message)
            } catch {
                showAlert(message: error.localizedDescription)
            }
        }
    }
    
}
