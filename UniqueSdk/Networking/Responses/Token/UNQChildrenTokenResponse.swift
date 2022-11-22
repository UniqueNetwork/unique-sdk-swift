//
//  UNQChildrenTokenResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTokenChildrenResponse: Codable {
    public let children: [UNQTokenId]
}

// MARK: - Child
public struct UNQTokenId: Codable {
    public let collectionId: Int
    public let tokenId: Int
}
