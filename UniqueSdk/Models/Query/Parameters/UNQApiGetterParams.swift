//
//  UNQApiGetterParams.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public struct UNQApiGetterParams: Codable {
    public let endpoint: String
    public let module: String
    public let method: String
    
    public init(endpoint: String, module: String, method: String) {
        self.endpoint = endpoint
        self.module = module
        self.method = method
    }
}
