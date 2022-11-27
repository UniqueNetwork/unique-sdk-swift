//
//  UNQConfirmSponsorshipBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQConfirmSponsorshipBody: Codable {
    public let address: String
    public let collectionId: Int
    
    public init(collectionId: Int, address: String) {
        self.collectionId = collectionId
        self.address = address
    }
}
