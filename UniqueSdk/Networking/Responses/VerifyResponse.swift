//
//  VerifyResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 01.11.2022.
//

import Foundation

public struct VerifyResponse: Codable {
    public let isValid: Bool
    public let errorMessage: String
}
