//
//  UNQAllowanceArgumentsQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQAllowanceArgumentsQuery: Codable {
    public let at: String?
    public let collectionId: Int
    public let tokenId: Int
    public let from: String
    public let to: String
    
    public init(at: String?, collectionId: Int, tokenId: Int, from: String, to: String) {
        self.at = at
        self.collectionId = collectionId
        self.tokenId = tokenId
        self.from = from
        self.to = to
    }
}
