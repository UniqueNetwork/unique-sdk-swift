//
//  UNQUnsignedTxPayloadBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public struct UNQUnsignedTxPayloadBody: Codable {
    public let signerPayloadJSON: UNQSignerPayloadJSON
    public let signerPayloadRaw: UNQSignerPayloadRaw
    public let signerPayloadHex: String
    
    public init(signerPayloadJSON: UNQSignerPayloadJSON, signerPayloadRaw: UNQSignerPayloadRaw, signerPayloadHex: String) {
        self.signerPayloadJSON = signerPayloadJSON
        self.signerPayloadRaw = signerPayloadRaw
        self.signerPayloadHex = signerPayloadHex
    }
}
