//
//  UNQAddTokensArgs.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public struct UNQAddTokensArgs: Codable {
    public let address: String
    public let recipient: String?
    public let collectionID: Int
    public let amount: Int

    public init(address: String, recipient: String?, collectionID: Int, amount: Int) {
        self.address = address
        self.recipient = recipient
        self.collectionID = collectionID
        self.amount = amount
    }
}
