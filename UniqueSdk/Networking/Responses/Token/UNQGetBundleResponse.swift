//
//  UNQGetBundleResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

// MARK: - Welcome
public struct UNQGetBundleResponse: Codable {
    public let tokenId: Int
    public let collectionId: Int
    public let owner: String
    public let attributes: UNQAny
    public let image: UNQAny
    public let nestingChildTokens: [UNQNestedToken]
    public let nestingParentToken: UNQTokenId?
    public let properties: [UNQTokenProperty]

    public init(tokenId: Int, collectionId: Int, owner: String, attributes: UNQAny, image: UNQAny, nestingChildTokens: [UNQNestedToken], nestingParentToken: UNQTokenId, properties: [UNQTokenProperty]) {
        self.tokenId = tokenId
        self.collectionId = collectionId
        self.owner = owner
        self.attributes = attributes
        self.image = image
        self.nestingChildTokens = nestingChildTokens
        self.nestingParentToken = nestingParentToken
        self.properties = properties
    }
}

// MARK: - NestingChildToken
public struct UNQNestedToken: Codable {
    public let tokenId: Int
    public let collectionId: Int
    public let owner: String
    public let attributes: UNQAny
    public let image: UNQAny
    public let nestingChildTokens: UNQAny
    public let nestingParentToken: UNQTokenId?
    public let properties: [UNQTokenProperty]


    public init(tokenId: Int, collectionId: Int, owner: String, attributes: UNQAny, image: UNQAny, nestingChildTokens: UNQAny, nestingParentToken: UNQTokenId?, properties: [UNQTokenProperty]) {
        self.tokenId = tokenId
        self.collectionId = collectionId
        self.owner = owner
        self.attributes = attributes
        self.image = image
        self.nestingChildTokens = nestingChildTokens
        self.nestingParentToken = nestingParentToken
        self.properties = properties
    }
}
