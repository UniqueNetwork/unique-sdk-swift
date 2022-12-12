//
//  UNQRepartitionTokenRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 12.12.2022.
//

import Foundation

public struct UNQRepartitionTokenRequest: Codable {
    public let collectionId: Int
    public let address: String
    public let tokenId: Int
    public let amount: Int

    public init(collectionId: Int, address: String, tokenId: Int, amount: Int) {
        self.collectionId = collectionId
        self.address = address
        self.tokenId = tokenId
        self.amount = amount
    }
}
