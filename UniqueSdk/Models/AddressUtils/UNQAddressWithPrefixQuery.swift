//
//  UNQAddressWithPrefixQuery.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public struct UNQAddressWithPrefixQuery: Codable {
    public let address: String
    public let ss58prefix: Int
    
    public init(address: String, ss58prefix: Int) {
        self.address = address
        self.ss58prefix = ss58prefix
    }
}
