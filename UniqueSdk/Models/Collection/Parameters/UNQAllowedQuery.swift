//
//  UNQAllowedQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 16.11.2022.
//

import Foundation

public struct UNQAllowedQuery: Codable {
    public let at: String?
    public let collectionId: Int
    public let account: String
    
    public init(at: String?, collectionId: Int, account: String) {
        self.at = at
        self.collectionId = collectionId
        self.account = account
    }
}
