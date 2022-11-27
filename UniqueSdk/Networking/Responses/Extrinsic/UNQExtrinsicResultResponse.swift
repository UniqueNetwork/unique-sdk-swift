//
//  UNQExtrinsicResultResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public struct UNQExtrinsicResultResponse: Codable {
    public let status: String
    public let isCompleted: Bool
    public let isError: Bool
    public let blockHash: String?
    public let blockIndex: Int?
    public let error: JSONAny?
    public let events: [UNQExtrinsicResultEvent]?
    public let parsed: JSONAny?
    public let fee: UNQFeeResponse?
    public let callbackUrl: String?
    public let useMethod: Bool?
}

// MARK: - Event
public struct UNQExtrinsicResultEvent: Codable {
    public let section: String
    public let method: String
    public let data: JSONAny
}
