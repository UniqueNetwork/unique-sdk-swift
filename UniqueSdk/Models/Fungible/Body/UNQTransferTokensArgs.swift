//
//  UNQTransferTokensArgs.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQTransferTokensArgs

public struct UNQTransferTokensArgs: Codable {
    public let address: String
    public let recipient: String
    public let amount: Int
    public let collectionID: Int

    public init(address: String, recipient: String, amount: Int, collectionID: Int) {
        self.address = address
        self.recipient = recipient
        self.amount = amount
        self.collectionID = collectionID
    }
}
