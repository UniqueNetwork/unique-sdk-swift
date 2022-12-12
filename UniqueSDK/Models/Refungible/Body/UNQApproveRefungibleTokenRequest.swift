//
//  UNQApproveRefungibleTokenRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 12.12.2022.
//

import Foundation

public struct UNQApproveRefungibleTokenRequest: Codable {
    public let address: String
    public let spender: String
    public let collectionId: Int
    public let tokenId: Int
    public let amount: Int

    public init(address: String, spender: String, collectionId: Int, tokenId: Int, amount: Int) {
        self.address = address
        self.spender = spender
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.amount = amount
    }
}
