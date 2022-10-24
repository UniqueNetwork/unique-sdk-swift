//
//  BalanceTransferResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

// MARK: - BalanceTransferResponse
struct BalanceTransferResponse: Codable {
    let signerPayloadJSON: SignerPayloadJSON
    let signerPayloadRaw: SignerPayloadRaw
    let signerPayloadHex: String
    let fee: Fee
}

// MARK: - SignerPayloadJSON
struct SignerPayloadJSON: Codable {
    let address, blockHash, blockNumber, era: String
    let genesisHash, method, nonce, specVersion: String
    let tip, transactionVersion: String
    let signedExtensions: [String]
    let version: Int
}

// MARK: - SignerPayloadRaw
struct SignerPayloadRaw: Codable {
    let address, data, type: String
}
