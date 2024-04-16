//
//  PriceClient.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 15.04.2024.
//

import Factory
import Foundation

struct PriceClient: PriceClientProtocol {
    
    @Injected(\.networkService) private var networkService
    
    func getPreviousClosePrice(_ name: String) async throws -> TickerPriceResponse {
        let urlRequest = try PriceRESTRequestBuilder.getPreviousClosePrice(name).asURLRequest()
        let dtoModel = try await networkService.responseModel(urlRequest, successModel: TickerPriceResponseDTO.self, failureModel: TickerPriceErrorDTO.self)
        return dtoModel.toDomain()
    }

}
