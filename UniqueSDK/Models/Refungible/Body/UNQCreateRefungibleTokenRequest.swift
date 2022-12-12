//
//  UNQCreateRefungibleTokenRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 12.12.2022.
//

import Foundation

public struct UNQCreateRefungibleTokenRequest: Codable {
    public let owner: String
    public let data: UNQTokenToCreateDto?
    public let properties: UNQTokenProperty?
    public let address: String
    public let collectionId: Int
    
    public init(owner: String, data: UNQTokenToCreateDto?, properties: UNQTokenProperty?, address: String, collectionId: Int) {
        self.owner = owner
        self.data = data
        self.properties = properties
        self.address = address
        self.collectionId = collectionId
    }
}
