//
//  UNQChainPropertiesResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQChainPropertiesResponse

public struct UNQChainPropertiesResponse: Codable {
    public let ss58Prefix: Int
    public let token: String
    public let decimals: Int
    public let wsURL: String
    public let genesisHash: String
    
    enum CodingKeys: String, CodingKey {
         case ss58Prefix = "SS58Prefix"
         case token = "token"
         case decimals = "decimals"
         case wsURL = "wsUrl"
         case genesisHash = "genesisHash"
     }
}
