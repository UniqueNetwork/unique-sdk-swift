//
//  UNQSignatureType.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

public enum UNQSignatureType: String, Codable {
    case sr25519
    case ed25519
    case ecdsa
    case ethereum
}
