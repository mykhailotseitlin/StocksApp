//
//  Container+Extensions.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 14.04.2024.
//

import Factory
import Foundation

extension Container {
    
    var tickerClient: Factory<TickerClientProtocol> {
        self { TickerClient() }
    }
    
    var priceClient: Factory<PriceClientProtocol> {
        self { PriceClient() }
    }
    
    var networkService: Factory<NetworkServiceProtocol> {
        self { NetworkService() }
    }
    
    var userDefaultsStorage: Factory<StorageProtocol> {
        self { UserDefaultsStorage() }
    }
    
}
