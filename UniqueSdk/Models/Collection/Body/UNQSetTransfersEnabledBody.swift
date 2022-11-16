//
//  UNQSetTransfersEnabledBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQSetTransfersEnabledBody: Codable {
    public let address: String
    public let collectionId: Int
    public let isEnabled: Bool
    
    public init(address: String, collectionId: Int, isEnabled: Bool) {
        self.address = address
        self.collectionId = collectionId
        self.isEnabled = isEnabled
    }
}
