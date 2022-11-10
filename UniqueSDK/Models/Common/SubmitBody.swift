//
//  SubmitBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

struct SubmitBody: Codable {
    let signerPayloadJSON: SignerPayloadJSON
    let signerPayloadRaw: SignerPayloadRaw
    let signerPayloadHex: String
    let signature: String
    
    init(signerPayloadJSON: SignerPayloadJSON,
         signerPayloadRaw: SignerPayloadRaw,
         signerPayloadHex: String,
         signature: String) {
        self.signerPayloadJSON = signerPayloadJSON
        self.signerPayloadRaw = signerPayloadRaw
        self.signerPayloadHex = signerPayloadHex
        self.signature = signature
    }
}
