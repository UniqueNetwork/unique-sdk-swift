//
//  UNQGetFungibleBalanceArgsRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public struct UNQGetFungibleBalanceArgsRequest: Codable {
    public let at: String?
    public let address: String
    public let collectionId: Int
    
    public init(at: String?, address: String, collectionId: Int) {
        self.at = at
        self.address = address
        self.collectionId = collectionId
    }
}
