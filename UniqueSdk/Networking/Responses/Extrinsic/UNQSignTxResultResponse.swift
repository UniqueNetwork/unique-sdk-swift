//
//  UNQSignTxResultResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public struct UNQSignTxResultResponse: Codable {
    public let signature: String
    public let signatureType: UNQSignatureType
}
