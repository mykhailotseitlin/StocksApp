//
//  BaseError.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct BaseError: Equatable, Error {
    
    let message: String
    let kind: Kind
    
    enum Kind {
        case minor
        case major
        case blocker
    }
    
}
