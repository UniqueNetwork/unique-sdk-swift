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
        print("mnemonic 11111 = \(mnemonic)")
        let factory = SeedFactory(mnemonicLanguage: .english)
        let seed = try factory.deriveSeed(from: mnemonic, password: "")
        
        print("seed bytes 111111 \(seed.raw.bytes)")
        let keyPair = try SR25519KeypairFactory().createKeypairFromSeed(seed)
        print("pubkey 111111 = \(keyPair.publicKey.raw.bytes)")
        print("privkey 111111 = \(keyPair.privateRaw.bytes)")

        let sr25519Signature = try SignWrapper().signSr25519(data, keyPair: keyPair)
        print("signature 111111 = \(sr25519Signature.raw.bytes)")
        print("signature 111111 = \(sr25519Signature.toString())")

        
        
        
        
        return sr25519Signature.toString()
    }
    
    private func getMnemonic(account: UNQAccount) -> String? {
        let service = KeychainService()
        let mnemonic = service.loadFromKeychain(key: account.address)
        return mnemonic
    }
    
}
