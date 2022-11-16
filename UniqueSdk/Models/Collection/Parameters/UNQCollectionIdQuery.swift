//
//  UNQCollectionIdQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQCollectionIdQuery: Codable {
    public let at: String?
    public let collectionId: Int
    
    public init(at: String?, collectionId: Int) {
        self.at = at
        self.collectionId = collectionId
    }
}
