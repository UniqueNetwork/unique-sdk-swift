//
//  UNQSubmitTxBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public struct UNQSubmitTxBody: Codable {
    public let signerPayloadJSON: UNQSignerPayloadJSON
    public let signature: String
    
    public init(signerPayloadJSON: UNQSignerPayloadJSON, signature: String) {
        self.signerPayloadJSON = signerPayloadJSON
        self.signature = signature
    }
}
