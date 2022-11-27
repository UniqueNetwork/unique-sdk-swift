//
//  UNQGetExtrinsicQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public struct UNQGetExtrinsicQuery: Codable {
    public let blockHashOrNumber: String
    public let extrinsicHash: String
    
    public init(blockHashOrNumber: String, extrinsicHash: String) {
        self.blockHashOrNumber = blockHashOrNumber
        self.extrinsicHash = extrinsicHash
    }
}
