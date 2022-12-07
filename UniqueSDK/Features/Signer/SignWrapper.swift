//
//  SignWrapper.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import Sr25519

public class SignWrapper {
    
    public init() {}
    
    public func signSr25519(_ originalData: Data, keyPair: Sr25519KeyPair) throws
    -> Sr25519Signature {
        let signature = keyPair.sign(message: originalData)
        return signature
    }
}
