//
//  UNQDeleteCollectionPropertyBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQDeleteCollectionPropertiesBody: Codable {
    public let address: String
    public let collectionId: Int
    public let propertyKeys: [String]
    
    public init(address: String, collectionId: Int, propertyKeys: [String]) {
        self.address = address
        self.collectionId = collectionId
        self.propertyKeys = propertyKeys
    }
}
