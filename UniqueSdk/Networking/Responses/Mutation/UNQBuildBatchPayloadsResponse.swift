//
//  UNQBuildBatchPayloadsResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public struct UNQBuildBatchPayloadsResponse: Codable {
    public let payloads: [UNQUnsignedTxPayloadResponse]
    public let nextNonce: Int
}
