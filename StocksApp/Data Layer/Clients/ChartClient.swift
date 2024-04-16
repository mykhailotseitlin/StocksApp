//
//  ChartClient.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Factory
import Foundation

struct ChartClient: ChartClientProtocol {
    
    @Injected(\.networkService) private var networkService
    
    func getAggregateBars(name: String, fromDate: String, toDate: String) async throws -> TickerPriceResponse {
        let urlRequest = try ChartRESTRequestBuilder.getAggregateBars(name: name, fromDate: fromDate, toDate: toDate).asURLRequest()
        let dtoModel = try await networkService.responseModel(urlRequest, successModel: TickerPriceResponseDTO.self, failureModel: TickerPriceErrorDTO.self)
        return dtoModel.toDomain()
    }
    
}
