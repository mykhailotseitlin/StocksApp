//
//  DomainMapped.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

protocol DomainMapped: Decodable {
    
    associatedtype Domain
    func toDomain() -> Domain
    
}
