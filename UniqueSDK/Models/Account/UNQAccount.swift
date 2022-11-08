//
//  UNQAccount.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

public struct UNQAccount: Codable {
    public let name: String
    public let address: String
    
    public init(name: String, address: String, mnemonic: String) {
        let service = KeychainService()
        service.saveToKeycahin(key: address, value: mnemonic)
        
        self.name = name
        self.address = address
    }
    
}
