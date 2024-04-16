//
//  TickerDetailView.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import SwiftUI

struct TickerDetailView: View {
    
    @StateObject var viewModel: TickerDetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Detailed Information for \(viewModel.ticker.symbol)")
                .font(.headline)
            
            Text("Company Name: \(viewModel.ticker.name)")
                .font(.headline)
            Text("Current Price: \(viewModel.ticker.currentPrice.formatted(.number.precision(.fractionLength(2))))")
                .font(.headline)
            Text("Daily Change: \(viewModel.ticker.dailyChange.formatted(.number.precision(.fractionLength(2))))")
                .font(.headline)
                .foregroundColor(viewModel.ticker.dailyChange >= 0 ? .green : .red)
            Text("Daily Change Percent: \(viewModel.ticker.dailyChangePercent.formatted(.percent.scale(1).precision(.fractionLength(2))))")
                .font(.headline)
                .foregroundColor(viewModel.ticker.dailyChangePercent >= 0 ? .green : .red)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .navigationTitle(viewModel.ticker.symbol)
        .task {
            await viewModel.loadData()
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(title: Text(viewModel.alertContent.title), message: Text(viewModel.alertContent.message), dismissButton: .default(Text("Ok")))
        }
    }
    
}

#Preview {
    TickerDetailView(viewModel: TickerDetailViewModel(ticker: .mock))
}
