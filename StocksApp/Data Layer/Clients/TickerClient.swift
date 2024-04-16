//
//  TickerClient.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Factory
import Foundation

struct TickerClient: TickerClientProtocol {
    
    @Injected(\.networkService) private var networkService
    
    func getTickers() async throws -> TickersResponse {
        let urlRequest = try TickersRESTRequestBuilder.getTickers.asURLRequest()
        let dtoModel = try await networkService.responseModel(urlRequest, successModel: TickersResponseDTO.self)
        return dtoModel.toDomain()
    }
    
    func getTickerDetails(_ name: String) async throws -> TickerDetailsResponse {
        let urlRequest = try TickersRESTRequestBuilder.getTickerDetails(name).asURLRequest()
        let dtoModel = try await networkService.responseModel(urlRequest, successModel: TickerDetailsResponseDTO.self)
        return dtoModel.toDomain()
    }
    
    func searchTickers(_ searchText: String) async throws -> TickersResponse {
        let urlRequest = try TickersRESTRequestBuilder.searchTickers(searchText).asURLRequest()
        let dtoModel = try await networkService.responseModel(urlRequest, successModel: TickersResponseDTO.self)
        return dtoModel.toDomain()
    }
    
}
