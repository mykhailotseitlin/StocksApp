//
//  StocksOverviewView.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import SwiftUI

struct StocksOverviewView: View {
    
    @StateObject var viewModel = StockOverviewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.tickers) { ticker in
                NavigationLink(destination: TickerDetailView(viewModel: TickerDetailViewModel(ticker: ticker))) {
                    TickerRow(ticker: ticker)
                }
            }
            .navigationTitle("Stocks Overview")
            .navigationBarItems(
                trailing: NavigationLink(destination: StockListView(viewModel: StockListViewModel())) {
                    Text("List of Stocks")
                }
            )
            .task {
                await viewModel.fetchStocks()
            }
            .refreshable {
                await viewModel.fetchStocks()
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text(viewModel.alertContent.title), message: Text(viewModel.alertContent.message), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
}

#Preview {
    StocksOverviewView()
}

