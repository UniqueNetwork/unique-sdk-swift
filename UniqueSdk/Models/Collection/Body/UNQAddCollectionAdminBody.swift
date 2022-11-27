//
//  UNQAddCollectionAdminBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQAddCollectionAdminBody: Codable {
    public let address: String
    public let collectionId: Int
    public let newAdmin: String
    
    public init(collectionId: Int, address: String, newAdmin: String) {
        self.collectionId = collectionId
        self.address = address
        self.newAdmin = newAdmin
    }
}
