//
//  UNQSetSponsorshipBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQSetSponsorshipBody: Codable {
    public let address: String
    public let collectionId: Int
    public let newSponsor: String
    
    public init(collectionId: Int, address: String, newSponsor: String) {
        self.collectionId = collectionId
        self.address = address
        self.newSponsor = newSponsor
    }
}
