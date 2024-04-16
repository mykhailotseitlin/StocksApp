//
//  AddStockView.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import SwiftUI

struct AddStockView: View {
    
    @StateObject var viewModel = AddStockViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tickers) { ticker in
                    Button(action: {
                        viewModel.saveTicker(ticker)
                    }, label: {
                        Text("\(ticker.symbol) - \(ticker.name)")
                    })
                }
            }
            .navigationTitle("Add Stock")
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
            .task {
                await viewModel.listenToSearchText()
            }
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text(viewModel.alertContent.title), message: Text(viewModel.alertContent.message), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
}

#Preview {
    AddStockView()
}
