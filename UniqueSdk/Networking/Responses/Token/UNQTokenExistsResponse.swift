//
//  UNQTokenExistsResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTokenExistsResponse: Codable {
    public let isExist: Bool
    
    public init(isExist: Bool) {
        self.isExist = isExist
    }
}
