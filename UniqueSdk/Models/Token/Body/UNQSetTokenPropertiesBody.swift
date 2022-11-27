//
//  UNQSetTokenPropertiesBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQSetTokenPropertiesBody: Codable {
    public let address: String
    public let collectionId: Int
    public let tokenId: Int
    public let properties: [UNQTokenProperty]

    public init(address: String, collectionId: Int, tokenId: Int, properties: [UNQTokenProperty]) {
        self.address = address
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.properties = properties
    }
}
