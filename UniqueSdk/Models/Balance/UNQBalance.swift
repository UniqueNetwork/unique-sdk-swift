//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.10.2022.
//

import Foundation

// MARK: - Balance

public struct UNQBalance: Codable {
    public let availableBalance: UNQBalanceDetail
    public let lockedBalance: UNQBalanceDetail
    public let freeBalance: UNQBalanceDetail
    public let address: String
}

// MARK: - BalanceDetail

public struct UNQBalanceDetail: Codable {
    public let raw: String
    public let amount: String
    public let unit: String
    public let decimals: Int
}
