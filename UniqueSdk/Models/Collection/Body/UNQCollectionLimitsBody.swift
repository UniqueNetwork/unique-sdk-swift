//
//  UNQSetCollectionLimitsBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQCollectionLimitsBody: Codable {
    public let limits: UNQCollectionLimits
    public let address: String
    public let collectionId: Int
    
    public init(limits: UNQCollectionLimits, address: String, collectionId: Int) {
        self.limits = limits
        self.address = address
        self.collectionId = collectionId
    }
}
