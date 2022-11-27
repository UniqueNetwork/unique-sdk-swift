//
//  UNQTokenPropertiesResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQTokenPropertiesResponse: Codable {
    public let properties: [UNQTokenProperty]
    
    public init(properties: [UNQTokenProperty]) {
        self.properties = properties
    }
}
