//
//  SignResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct SignResponse: Codable {
    public let signature: String
    public let signerPayloadJSON: SignerPayloadJSON
    public let fee: FeeResponse?
}

