//
//  UNQCreateMultipleTokensBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

// MARK: - Welcome
public struct UNQCreateMultipleTokensBody: Codable {
    public let address: String
    public let collectionId: Int
    public let tokens: [UNQCreateTokenPayload]

    public init(address: String, collectionId: Int, tokens: [UNQCreateTokenPayload]) {
        self.address = address
        self.collectionId = collectionId
        self.tokens = tokens
    }
}

// MARK: - Token
public struct UNQCreateTokenPayload: Codable {
    public let owner: String?
    public let data: UNQTokenToCreateDto?
    public let properties: [UNQTokenProperty]?

    public init(owner: String?, data: UNQTokenToCreateDto?, properties: [UNQTokenProperty]?) {
        self.owner = owner
        self.data = data
        self.properties = properties
    }
}
