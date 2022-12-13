//
//  UNQTransferRefungibleTokenRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 12.12.2022.
//

import Foundation

public struct UNQTransferRefungibleTokenRequest: Codable {
    public let collectionId: Int
    public let tokenId: Int
    public let address: String
    public let from: String?
    public let to: String
    public let amount: Int?

    public init(collectionId: Int, tokenId: Int, address: String, from: String?, to: String, amount: Int?) {
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.address = address
        self.from = from
        self.to = to
        self.amount = amount
    }
}
