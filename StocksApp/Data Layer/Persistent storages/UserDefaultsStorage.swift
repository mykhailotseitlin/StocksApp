//
//  UserDefaultsStorage.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct UserDefaultsStorage: StorageProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func save<T: Encodable>(_ model: T, forKey key: String) -> Bool {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(model) {
            userDefaults.set(data, forKey: key)
            return true
        } else {
            return false
        }
    }
    
    func load<T: Decodable>(forKey key: String) -> T? {
        if let data = userDefaults.data(forKey: key) {
            let decoder = JSONDecoder()
            if let model = try? decoder.decode(T.self, from: data) {
                return model
            }
        }
        return nil
    }
    
    func remove(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
    func clean() {
        userDefaults.dictionaryRepresentation().keys.forEach {
            remove(forKey: $0)
        }
    }
    
}
