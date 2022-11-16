//
//  UNQRemoveCollectionAdminBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQRemoveCollectionAdminBody: Codable {
    public let address: String
    public let collectionId: Int
    public let admin: String
    
    public init(collectionId: Int, address: String, admin: String) {
        self.collectionId = collectionId
        self.address = address
        self.admin = admin
    }
}
