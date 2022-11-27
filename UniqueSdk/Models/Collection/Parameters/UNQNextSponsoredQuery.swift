//
//  UNQNextSponsoredQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQNextSponsoredQuery: Codable {
    public let at: String?
    public let collectionId: Int
    public let address: String
    public let tokenId: Int
    
    public init(at: String?, collectionId: Int, address: String, tokenId: Int) {
        self.at = at
        self.collectionId = collectionId
        self.address = address
        self.tokenId = tokenId
    }
}
