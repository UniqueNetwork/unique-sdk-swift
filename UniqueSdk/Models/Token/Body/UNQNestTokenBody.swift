//
//  UNQNestTokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQNestTokenBody: Codable {
    public let address: String
    public let parent: UNQNestedTokenObject
    public let nested: UNQNestedTokenObject
    public let value: Int?

    public init(address: String, parent: UNQNestedTokenObject, nested: UNQNestedTokenObject, value: Int?) {
        self.address = address
        self.parent = parent
        self.nested = nested
        self.value = value
    }
}

// MARK: - Nested
public struct UNQNestedTokenObject: Codable {
    public let collectionId: Int
    public let tokenId: Int

    public init(collectionId: Int, tokenId: Int) {
        self.collectionId = collectionId
        self.tokenId = tokenId
    }
}
