//
//  SignatureVerifier.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import Sr25519

public class SignatureVerifier {
        
    public init() {}
    
    public func verify(signature: Sr25519Signature, keyPair: Sr25519KeyPair, forOriginalData: Data) -> Bool {
        return keyPair.verify(message: forOriginalData, signature: signature)
    }
    
}
