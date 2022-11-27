//
//  UNQGetExtrinsicResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

// MARK: - UNQGetExtrinsicResponse

public struct UNQGetExtrinsicResponse: Codable {
    public let section: String
    public let method: String
    public let events: [JSONAny]
    public let args: [JSONAny]
    public let nonce: Int
    public let signer: String
}
