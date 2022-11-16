//
//  UNQAddToAllowListBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQAddToAllowListBody: Codable {
    public let collectionId: Int
    public let address: String
    public let newAdminId: String
    
    public init(collectionId: Int, address: String, newAdminId: String) {
        self.collectionId = collectionId
        self.address = address
        self.newAdminId = newAdminId
    }
}
