//
//  SignatureBuilder.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import LocalAuthentication
import Sr25519

protocol ISigner {
    func sign(account: UNQAccount,
              userAuthenticationType: UNQUserAuthenticationType,
              data: Data) async throws -> String
}

class Signer: ISigner {
    
    func sign(account: UNQAccount,
              userAuthenticationType: UNQUserAuthenticationType,
              data: Data) async throws -> String {
        let isVerified = try await UserAuthenticator().auth(userAuthenticationType: userAuthenticationType)
        guard isVerified else { throw UNQError.accountNotVerified }
        guard let mnemonic = getMnemonic(account: account) else { throw UNQError.mnemonicNotFound }
        let factory = SeedFactory(mnemonicLanguage: .english)
        let seed = try factory.deriveSeed(from: mnemonic, password: "")
        let keyPair = try SR25519KeypairFactory().createKeypairFromSeed(seed)
        let signature = try SignWrapper().signSr25519(data, keyPair: keyPair)
        return signature.toString()
    }
    
    private func getMnemonic(account: UNQAccount) -> String? {
        let service = KeychainService()
        let mnemonic = service.loadFromKeychain(key: account.address)
        return mnemonic
    }
    
}
