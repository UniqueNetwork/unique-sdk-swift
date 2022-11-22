//
//  UNQAccountTokensResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQAccountTokensResponse: Codable {
    public let tokens: [UNQTokenId]
    
    public init(tokens: [UNQTokenId]) {
        self.tokens = tokens
    }
}
