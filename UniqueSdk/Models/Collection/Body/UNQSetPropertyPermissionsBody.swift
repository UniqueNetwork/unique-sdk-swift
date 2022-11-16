//
//  UNQSetPropertyPermissionsBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQSetPropertyPermissionsBody: Codable {
    public let address: String
    public let collectionId: Int
    public let propertyPermissions: [UNQPropertyKeyPermission]
    
    public init(address: String, collectionId: Int, propertyPermissions: [UNQPropertyKeyPermission]) {
        self.address = address
        self.collectionId = collectionId
        self.propertyPermissions = propertyPermissions
    }
}
