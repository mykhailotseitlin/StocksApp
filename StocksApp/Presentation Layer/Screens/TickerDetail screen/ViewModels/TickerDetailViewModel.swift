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
    @Published var chartContent = TickerDetailModels.ChartContent()
    
    @Injected(\.priceClient) private var priceClient
    @Injected(\.chartClient) private var chartClient

    init(ticker: Ticker) {
        self.ticker = ticker
    }
    
    @MainActor func loadData() async {
        do {
            async let priceResponse = try await priceClient.getPreviousClosePrice(ticker.symbol)
            if let price = try await priceResponse.prices.first {
                ticker.updatePrice(price)
            }
            async let chartData = try await chartClient.getAggregateBars(name: ticker.symbol, fromDate: setDate(365), toDate: setDate())
            let data = try await chartData.prices.map { $0.closed }
            chartContent = TickerDetailModels.ChartContent(data: data)
        } catch let error as BaseError {
            showAlert(message: error.message)
        } catch {
            showAlert(message: error.localizedDescription)
        }
    }
    
}

private extension TickerDetailViewModel {
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }
    
    func setDate(_ day: Int = 0) -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .day, value: -day, to: currentDate) ?? Date()
        return dateFormatter.string(from: date)
    }
    
}
