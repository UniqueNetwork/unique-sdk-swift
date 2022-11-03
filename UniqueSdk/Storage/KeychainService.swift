//
//  KeychainService.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import KeychainAccess
import UIKit

protocol Keychainable {
    func saveToKeycahin(key: String, value: String)
    func deleteFromKeychain(keys: [String])
    func loadFromKeychain(key: String) -> String?
}

class KeychainService {
    
   private lazy var keychain = Keychain(service: Constants.service)
}

extension KeychainService: Keychainable {
    func loadFromKeychain(key: String) -> String? {
        let value = try? keychain.get(key)
        return value
    }
    
    func deleteFromKeychain(keys: [String]) {
        keys.forEach {
            keychain[$0] = nil
        }
    }
    
    func saveToKeycahin(key: String, value: String) {
        keychain[key] = value
    }
}

private extension KeychainService {
    
    enum Constants {
        static let service: String = "com.sber.kvd"
    }
}
