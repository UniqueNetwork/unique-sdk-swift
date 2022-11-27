//
//  UNQSetCollectionPermissionsBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct SetCollectionPermissionsBody: Codable {
    public let collectionId: Int
    public let address: String
    public let permissions: UNQCollectionPermissions
    
    public init(collectionId: Int, address: String, permissions: UNQCollectionPermissions) {
        self.collectionId = collectionId
        self.address = address
        self.permissions = permissions
    }
}
