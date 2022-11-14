//
//  UNQSubmitBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct UNQSubmitBody: Codable {
    public var signerPayloadJSON: SignerPayloadJSON
    public var signerPayloadRaw: SignerPayloadRaw
    public var signerPayloadHex: String
    public var signature: String
    
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
