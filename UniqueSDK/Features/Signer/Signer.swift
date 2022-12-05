//
//  SignatureBuilder.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import LocalAuthentication

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
        let seedFactoryResult = try factory.deriveSeed(from: mnemonic, password: "")
        let keyPairFactoryResult = try SR25519KeypairFactory().createKeypairFromSeed(seedFactoryResult.seed.prefix(32),
                                                                                     chaincodeList: [])
        let snSignature = try SignWrapper().signSr25519(data,
                                                        secretKeyData: keyPairFactoryResult.privateKey().rawData(),
                                                        publicKeyData: keyPairFactoryResult.publicKey().rawData())
        let signature = snSignature.toString()
        return signature
    }
    
    private func getMnemonic(account: UNQAccount) -> String? {
        let service = KeychainService()
        let mnemonic = service.loadFromKeychain(key: account.address)
        return mnemonic
    }
    
}
