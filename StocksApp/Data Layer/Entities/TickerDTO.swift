//
//  TickerDTO.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct TickerDTO: DomainMapped {
    
    let ticker, name: String
    let market: TickerMarket
    let locale: TickerLocale
    let primaryExchange: TickerPrimaryExchange?
    let type: TickerType
    let active: Bool
    let currencyName: TickerCurrencyName
    let cik: String?
    let compositeFigi: String?
    let shareClassFigi: String?
    let lastUpdatedUTC: String?
    
    enum CodingKeys: String, CodingKey {
        case ticker, name, market, locale
        case primaryExchange = "primary_exchange"
        case type, active
        case currencyName = "currency_name"
        case cik
        case compositeFigi = "composite_figi"
        case shareClassFigi = "share_class_figi"
        case lastUpdatedUTC = "last_updated_utc"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ticker = try container.decode(String.self, forKey: .ticker)
        self.name = try container.decode(String.self, forKey: .name)
        self.market = (try? container.decode(TickerMarket.self, forKey: .market)) ?? .other
        self.locale = (try? container.decode(TickerLocale.self, forKey: .locale)) ?? .other
        self.primaryExchange = (try? container.decodeIfPresent(TickerPrimaryExchange.self, forKey: .primaryExchange)) ?? .other
        self.type = (try? container.decode(TickerType.self, forKey: .type)) ?? .other
        self.active = try container.decode(Bool.self, forKey: .active)
        self.currencyName = (try? container.decode(TickerCurrencyName.self, forKey: .currencyName)) ?? .other
        self.cik = try container.decodeIfPresent(String.self, forKey: .cik)
        self.compositeFigi = try container.decodeIfPresent(String.self, forKey: .compositeFigi)
        self.shareClassFigi = try container.decodeIfPresent(String.self, forKey: .shareClassFigi)
        self.lastUpdatedUTC = try container.decodeIfPresent(String.self, forKey: .lastUpdatedUTC)
    }
    
    func toDomain() -> Ticker {
        Ticker(symbol: ticker, name: name, currentPrice: 0, dailyChange: 0, dailyChangePercent: 0)
    }
    
}
