//
//  SignWrapper.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import IrohaCrypto

public class SignWrapper {
    
    public init() {}
    
   public func signSr25519(_ originalData: Data, secretKeyData: Data, publicKeyData: Data) throws
        -> SNSignature {
        let privateKey = try SNPrivateKey(rawData: secretKeyData)
        let publicKey = try SNPublicKey(rawData: publicKeyData)

        let signer = SNSigner(keypair: SNKeypair(privateKey: privateKey, publicKey: publicKey))
        let signature = try signer.sign(originalData)

        return signature
    }
    
}
