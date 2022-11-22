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
    public let collectionID: Int
    public let tokenID: Int
    public let isApprove: Bool

    public init(address: String, spender: String, collectionID: Int, tokenID: Int, isApprove: Bool) {
        self.address = address
        self.spender = spender
        self.collectionID = collectionID
        self.tokenID = tokenID
        self.isApprove = isApprove
    }
}
