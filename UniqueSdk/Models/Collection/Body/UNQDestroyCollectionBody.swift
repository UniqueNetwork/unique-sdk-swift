//
//  UNQDestroyCollectionBoyd.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQDestroyCollectionBody: Codable {
    public let address: String
    public let collectionId: Int
    
    public init(address: String, collectionId: Int) {
        self.address = address
        self.collectionId = collectionId
    }
}
