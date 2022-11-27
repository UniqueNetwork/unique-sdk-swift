//
//  UNQVerificationResultResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 01.11.2022.
//

import Foundation

public struct UNQVerificationResultResponse: Codable {
    public let isValid: Bool
    public let errorMessage: String
}
