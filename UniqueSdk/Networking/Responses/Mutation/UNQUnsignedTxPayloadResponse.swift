//
//  UNQUnsignedTxPayloadResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

// MARK: - UNQUnsignedTxPayloadResponse
public struct UNQUnsignedTxPayloadResponse: Codable {
    public let signerPayloadJSON: UNQSignerPayloadJSON
    public let signerPayloadRaw: UNQSignerPayloadRaw
    public let signerPayloadHex: String
    public let fee: UNQFeeResponse?
}

// MARK: - UNQSignerPayloadJSON
public struct UNQSignerPayloadJSON: Codable {
    let address, blockHash, blockNumber, era: String
    let genesisHash, method, nonce, specVersion: String
    let tip, transactionVersion: String
    let signedExtensions: [String]
    let version: Int
}

// MARK: - UNQSignerPayloadRaw
public struct UNQSignerPayloadRaw: Codable {
    let address, data, type: String
}
