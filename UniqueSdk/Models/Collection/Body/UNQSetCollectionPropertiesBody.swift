//
//  UNQSetCollectionPropertiesBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQSetCollectionPropertiesBody: Codable {
    public let address: String
    public let collectionId: String
    public let properties: [UNQCollectionProperty]
    
    public init(address: String, collectionId: String, properties: [UNQCollectionProperty]) {
        self.address = address
        self.collectionId = collectionId
        self.properties = properties
    }
}
