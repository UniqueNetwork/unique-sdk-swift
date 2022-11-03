//
//  BalanceTransferSubmitBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct BalanceTransferSubmitBody: Codable {
    public let signerPayloadJSON: SignerPayloadJSON
    public let signerPayloadRaw: SignerPayloadRaw
    public let signerPayloadHex: String
    public let signature: String
    
    public init(signerPayloadJSON: SignerPayloadJSON,
                signerPayloadRaw: SignerPayloadRaw,
                signerPayloadHex: String,
                signature: String) {
        self.signerPayloadJSON = signerPayloadJSON
        self.signerPayloadRaw = signerPayloadRaw
        self.signerPayloadHex = signerPayloadHex
        self.signature = signature
    }
}
