//
//  BalanceTransferParameters.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct BalanceTransferParameters: Codable {
    public let use: UseType?
    public let withFee: Bool?
    public let verify: Bool?
    public let callbackUrl: String?
    public let nonce: Int?
}
