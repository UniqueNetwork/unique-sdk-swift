//
//  UNQPropertyPermissionsQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQPropertyPermissionsQuery: Codable {
    public let collectionId: Int
    public let propertyKeys: [String]?
    public let at: String?
    
    public init(collectionId: Int, propertyKeys: [String]?, at: String?) {
        self.collectionId = collectionId
        self.propertyKeys = propertyKeys
        self.at = at
    }
}
