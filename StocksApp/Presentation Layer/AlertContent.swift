//
//  AlertContent.swift
//  StocksApp
//
//  Created by Mykhailo Tseitlin on 16.04.2024.
//

import Foundation

struct AlertContent {
    
    let title: String
    let message: String
    
    init(title: String = "",
         message: String = "") {
        self.title = title
        self.message = message
    }
    
}
