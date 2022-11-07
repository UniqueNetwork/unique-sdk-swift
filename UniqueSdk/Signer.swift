//
//  SignatureBuilder.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import LocalAuthentication

protocol ISigner {
    func sign(account: UNQAccount, data: Data, completion: @escaping (Result<String, Error>) -> Void)
}

class Signer: ISigner {
    
    func sign(account: UNQAccount, data: Data, completion: @escaping (Result<String, Error>) -> Void) {
        
        print("in sign")
        AccountVerifier(account: account).verify { result in
            if case let .success(mnemonic) = result {
                do {
                    print("matched")
                let factory = SeedFactory(mnemonicLanguage: .english)
                    var seedFactoryResult = try factory.deriveSeed(from: mnemonic, password: "")
                let keyPairFactoryResult = try SR25519KeypairFactory().createKeypairFromSeed(seedFactoryResult.seed.prefix(32), chaincodeList: [])
                let snSignature = try SignWrapper().signSr25519(data, secretKeyData: keyPairFactoryResult.privateKey().rawData(), publicKeyData: keyPairFactoryResult.publicKey().rawData())
                    let signature = snSignature.toString()
                    completion(.success(signature))
                } catch(let error) {
                    completion(.failure(error))
                }
            }
            if case let .failure(error) = result {
//                print(error.description)
                completion(.failure(error))
            }
        }

    }
    
    
    
}
