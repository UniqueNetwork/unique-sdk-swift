//
//  UNQTasd.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTransferTokenBody: Codable {
    public let collectionId: Int
    public let tokenId: Int
    public let address: String
    public let from: String?
    public let to: String
    public let value: Int?

    public init(collectionId: Int, tokenId: Int, address: String, from: String?, to: String, value: Int?) {
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.address = address
        self.from = from
        self.to = to
        self.value = value
    }
}
