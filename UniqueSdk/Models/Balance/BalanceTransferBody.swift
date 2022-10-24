//
//  BalanceTransferBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct BalanceTransferBody: Codable {
    public let address: String
    public let destination: String
    public let amount: Double
    
    public init(address: String, destination: String, amount: Double) {
        self.address = address
        self.destination = destination
        self.amount = amount
    }
}
