//
//  UNQApiRequestBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public struct UNQApiRequestBody: Codable {
    public let args: [String]
    
    public init(args: [String]) {
        self.args = args
    }
}
