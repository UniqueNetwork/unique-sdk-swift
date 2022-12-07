//
//  SR25519KeypairFactory.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import Sr25519

public protocol KeypairFactoryProtocol {
    func createKeypairFromSeed(_ seed: Sr25519Seed) throws -> Sr25519KeyPair
}

public class SR25519KeypairFactory: KeypairFactoryProtocol {
   
    public init() {}
    
    public func createKeypairFromSeed(_ seed: Sr25519Seed) throws -> Sr25519KeyPair {
        let keyPair = Sr25519KeyPair(seed: seed)
        return keyPair
    }
}
