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
              confirmationType: UNQUserAuthenticationType,
              data: Data,
              completion: @escaping (Result<String, Error>) -> Void)
}

class Signer: ISigner {
    
    func sign(account: UNQAccount,
              confirmationType: UNQUserAuthenticationType,
              data: Data,
              completion: @escaping (Result<String, Error>) -> Void) {
        UserAuthenticator().auth(confirmationType: confirmationType) { result in
            if case let .success(isVerified) = result {
                guard isVerified else { return }
                guard let mnemonic = self.getMnemonic(account: account) else { completion(.failure(NSError())); return }
                do {
                    let factory = SeedFactory(mnemonicLanguage: .english)
                    let seedFactoryResult = try factory.deriveSeed(from: mnemonic, password: "")
                    let keyPairFactoryResult = try SR25519KeypairFactory().createKeypairFromSeed(seedFactoryResult.seed.prefix(32), chaincodeList: [])
                    let snSignature = try SignWrapper().signSr25519(
                        data,
                        secretKeyData: keyPairFactoryResult.privateKey().rawData(),
                        publicKeyData: keyPairFactoryResult.publicKey().rawData()
                    )
                    let signature = snSignature.toString()
                    completion(.success(signature))
                } catch(let error) {
                    completion(.failure(error))
                }
            }
            if case let .failure(error) = result {
                completion(.failure(error))
            }
        }
        
    }
    
    private func getMnemonic(account: UNQAccount) -> String? {
        let service = KeychainService()
        let mnemonic = service.loadFromKeychain(key: account.address)
        return mnemonic
    }
    
}
