//
//  UNQError.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.12.2022.
//

import Foundation

public enum UNQError: Error {
    case invalidHex
    case accountNotVerified
    case mnemonicNotFound
    case passcodeNotFound
}

extension UNQError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidHex:
            return "Could not create valid data for signing from hex"
        case .accountNotVerified:
            return "User account not verified, check user passcode"
        case .mnemonicNotFound:
            return "Could not find mnemonic in storage"
        case .passcodeNotFound:
            return "Passcode for account no found"
        }
    }
}
