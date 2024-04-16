//
//  NetworkService.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 13.04.2024.
//

import Alamofire
import Foundation

struct NetworkService: NetworkServiceProtocol {
    
    func responseModel<S: Decodable, F: DomainMapped & Error>(_ request: URLRequestConvertible,
                                                              successModel: S.Type,
                                                              failureModel: F.Type = APIBaseErrorResponseDTO.self) async throws -> S {
        return try await withCheckedThrowingContinuation { checkedContinuation in
            AF.request(request)
                .validate()
                .response { response in
                    switch response.result {
                    case let .success(data):
                        if let data = data {
                            print(#line, #function, "json of \(request.urlRequest?.url?.absoluteString ?? ""): \(String(data: data, encoding: .utf8) ?? "")")
                            do {
                                let model = try JSONDecoder().decode(S.self, from: data)
                                checkedContinuation.resume(returning: model)
                            } catch let error {
                                checkedContinuation.resume(throwing: BaseError(message: error.localizedDescription, kind: .major))
                            }
                        } else {
                            if let emptyModel = EmptyResponseDTO() as? S {
                                checkedContinuation.resume(returning: emptyModel)
                            } else {
                                checkedContinuation.resume(throwing: BaseError(message: "Empty Response Unwrapping issue", kind: .major))
                            }
                        }
                    case let .failure(error):
                        if let errorData = response.data {
                            print(#line, #function, "error json of \(request.urlRequest?.url?.absoluteString ?? ""): \(String(data: errorData, encoding: .utf8) ?? "")")
                            do {
                                let dtoModel = try JSONDecoder().decode(F.self, from: errorData)
                                if let domainModel = dtoModel.toDomain() as? Error {
                                    checkedContinuation.resume(throwing: domainModel)
                                } else {
                                    checkedContinuation.resume(throwing: BaseError(message: "Empty Response Unwrapping issue", kind: .major))
                                }
                            } catch let error {
                                checkedContinuation.resume(throwing: BaseError(message: error.localizedDescription, kind: .major))
                            }
                        } else {
                            checkedContinuation.resume(throwing: BaseError(message: error.localizedDescription, kind: .major))
                        }
                    }
                }
        }
    }
}
