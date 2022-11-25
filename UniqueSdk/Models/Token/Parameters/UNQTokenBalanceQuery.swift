//
//  UNQTokenBalanceQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTokenBalanceQuery: Codable {
    public let at: String?
    public let collectionId: Int
    public let tokenId: Int
    public let address: String
    
    public init(at: String?, collectionId: Int, tokenId: Int, address: String) {
        self.at = at
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.address = address
    }
}
