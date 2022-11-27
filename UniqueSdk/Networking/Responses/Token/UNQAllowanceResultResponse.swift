//
//  UNQAllowanceResultResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQAllowanceResultResponse: Codable {
    public let isAllowed: Bool
    
    public init(isAllowed: Bool) {
        self.isAllowed = isAllowed
    }
}
