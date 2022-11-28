//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.10.2022.
//

import Foundation

// MARK: - Balance

public struct UNQAllBalancesResponse: Codable {
    public let availableBalance: UNQBalanceResponse
    public let lockedBalance: UNQBalanceResponse
    public let freeBalance: UNQBalanceResponse
    public let address: String
}

// MARK: - BalanceDetail

public struct UNQBalanceResponse: Codable {
    public let raw: String
    public let amount: String
    public let fromatted: String
    public let unit: String
    public let decimals: Int
}
