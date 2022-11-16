//
//  UNQRemoveFromAllowListBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQRemoveFromAllowListBody: Codable {
    public let collectionId: Int
    public let address: String
    public let addressToDelete: String
    
    public init(collectionId: Int, address: String, addressToDelete: String) {
        self.collectionId = collectionId
        self.address = address
        self.addressToDelete = addressToDelete
    }
}
