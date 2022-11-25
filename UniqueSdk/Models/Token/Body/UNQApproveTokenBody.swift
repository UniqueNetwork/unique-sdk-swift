//
//  UNQApproveTokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQApproveTokenBody: Codable {
    public let address: String
    public let spender: String
    public let collectionId: Int
    public let tokenId: Int
    public let isApprove: Bool

    public init(address: String, spender: String, collectionId: Int, tokenId: Int, isApprove: Bool) {
        self.address = address
        self.spender = spender
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.isApprove = isApprove
    }
}
