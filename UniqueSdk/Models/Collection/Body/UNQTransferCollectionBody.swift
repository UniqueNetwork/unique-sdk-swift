//
//  UNQTransferCollectionBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQTransferCollectionBody: Codable {
    public let collectionId: Int
    public let address: String
    public let to: String
    
    public init(collectionId: Int, address: String, to: String) {
        self.collectionId = collectionId
        self.address = address
        self.to = to
    }
}
