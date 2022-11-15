//
//  GetStatsResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

public struct UNQGetStatsResponse: Codable {
    public let created: Int
    public let destroyed: Int
    public let alive: Int
}
