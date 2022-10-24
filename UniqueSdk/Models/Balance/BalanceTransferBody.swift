//
//  BalanceTransferBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

struct BalanceTransferBody: Codable {
    public let address: String
    public let destination: String
    public let amount: String
}
