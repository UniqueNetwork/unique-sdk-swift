//
//  UNQDeleteTokenPropertiesBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQDeleteTokenPropertiesBody: Codable {
    public let address: String
    public let collectionId: Int
    public let tokenId: Int
    public let propertyKeys: [String]

    public init(address: String, collectionId: Int, tokenId: Int, propertyKeys: [String]) {
        self.address = address
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.propertyKeys = propertyKeys
    }
}
