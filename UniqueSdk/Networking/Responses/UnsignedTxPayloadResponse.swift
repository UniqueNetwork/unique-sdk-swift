//
//  UnsignedTxPayloadResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

// MARK: - UnsignedTxPayloadResponse
public struct UnsignedTxPayloadResponse: Codable {
    public let signerPayloadJSON: SignerPayloadJSON
    public let signerPayloadRaw: SignerPayloadRaw
    public let signerPayloadHex: String
    public let fee: FeeResponse?
}

// MARK: - SignerPayloadJSON
public struct SignerPayloadJSON: Codable {
    let address, blockHash, blockNumber, era: String
    let genesisHash, method, nonce, specVersion: String
    let tip, transactionVersion: String
    let signedExtensions: [String]
    let version: Int
}

// MARK: - SignerPayloadRaw
public struct SignerPayloadRaw: Codable {
    let address, data, type: String
}
