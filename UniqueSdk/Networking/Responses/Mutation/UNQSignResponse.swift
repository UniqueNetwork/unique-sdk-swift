//
//  UNQSignResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct UNQSignResponse: Codable {
    public let signature: String
    public let signerPayloadJSON: UNQSignerPayloadJSON
    public let fee: UNQFeeResponse?
}

