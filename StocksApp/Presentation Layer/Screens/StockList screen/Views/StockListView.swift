//
//  StockListView.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import SwiftUI

struct StockListView: View {
    
    @StateObject var viewModel = StockListViewModel()
    @State private var isPresentingAddStock = false

    var body: some View {
        List {
            ForEach(viewModel.tickers) { ticker in
                Text("\(ticker.symbol) - \(ticker.name)")
            }
            .onDelete(perform: viewModel.deleteTicker(at:))
        }
        .navigationTitle("List of Stocks")
        .navigationBarItems(
            trailing: Button(action: {
                isPresentingAddStock = true
            }) {
                Image(systemName: "plus")
            }
        )
        .task {
            viewModel.loadData()
        }
        .sheet(isPresented: $isPresentingAddStock, onDismiss: {
            viewModel.loadData()
        }) {
            AddStockView(viewModel: AddStockViewModel())
        }
    }
    
}

#Preview {
    StockListView()
}
