//
//  UNQTokenIdQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation

public struct UNQTokenIdQuery: Codable {
    public let at: String?
    public let collectionId: Int
    public let tokenId: Int
    
    public init(at: String?, collectionId: Int, tokenId: Int) {
        self.at = at
        self.collectionId = collectionId
        self.tokenId = tokenId
    }
}
