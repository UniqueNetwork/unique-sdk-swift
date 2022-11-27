//
//  UNQTokenBalanceResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTokenBalanceResponse: Codable {
    public let amount: Double
    
    public init(amount: Double) {
        self.amount = amount
    }
}
