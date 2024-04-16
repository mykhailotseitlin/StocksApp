//
//  StorageProtocol.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

protocol StorageProtocol {
    
    func save<T: Encodable>(_ model: T, forKey key: String) -> Bool
    func load<T: Decodable>(forKey key: String) -> T?
    func remove(forKey key: String)
    func clean()
    
}
