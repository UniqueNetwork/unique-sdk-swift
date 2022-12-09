//
//  SeedFactory.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import Bip39
import Sr25519
import UncommonCrypto


public protocol SeedFactoryProtocol {
    func deriveSeed(from mnemonicWords: String, password: String) throws -> Sr25519Seed
    
}

public struct SeedFactory: SeedFactoryProtocol {
    private let mnemonicLanguage: Wordlist

    public init(mnemonicLanguage: Wordlist = .english) {
        self.mnemonicLanguage = mnemonicLanguage
    }

    public func deriveSeed(from mnemonicWords: String, password: String) throws -> Sr25519Seed {
        let mnemonic = try Mnemonic(mnemonic: mnemonicWords.components(separatedBy: " "))
        let data = Data(mnemonic.substrate_seed().prefix(32))
        let seed = try Sr25519Seed(raw: data)
        return seed
    }
}
