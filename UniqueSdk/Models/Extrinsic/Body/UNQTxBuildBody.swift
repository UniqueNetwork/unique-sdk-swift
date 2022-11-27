//
//  UNQTxBuildBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public struct UNQTxBuildBody: Codable {
    public let address: String
    public let section: String
    public let method: String
    public let args: [JSONAny]
    
    public init(address: String, section: String, method: String, args: [JSONAny]) {
        self.address = address
        self.section = section
        self.method = method
        self.args = args
    }
}
