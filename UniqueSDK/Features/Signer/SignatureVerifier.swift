//
//  SignatureVerifier.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import IrohaCrypto

public class SignatureVerifier {
        
    public init() {}
    
    public func verify(signature: SNSignature, forOriginalData: Data, using: SNPublicKey) -> Bool {
        SNSignatureVerifier().verify(signature, forOriginalData: forOriginalData, using: using)
    }
    
}
