//
//  FeeResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct Fee: Codable {
    public let raw: String
    public let amount: String
    public let formatted: String
    public let unit: String
    public let decimals: Int
}
