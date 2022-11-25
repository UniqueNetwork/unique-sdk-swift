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
    public let attributes: JSONAny
    public let image: JSONAny
    public let nestingChildTokens: [UNQNestedToken]
    public let nestingParentToken: UNQTokenId?
    public let properties: [UNQTokenProperty]

    public init(tokenId: Int, collectionId: Int, owner: String, attributes: JSONAny, image: JSONAny, nestingChildTokens: [UNQNestedToken], nestingParentToken: UNQTokenId, properties: [UNQTokenProperty]) {
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
    public let attributes: JSONAny
    public let image: JSONAny
    public let nestingChildTokens: JSONAny
    public let nestingParentToken: UNQTokenId?
    public let properties: [UNQTokenProperty]


    public init(tokenId: Int, collectionId: Int, owner: String, attributes: JSONAny, image: JSONAny, nestingChildTokens: JSONAny, nestingParentToken: UNQTokenId?, properties: [UNQTokenProperty]) {
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
