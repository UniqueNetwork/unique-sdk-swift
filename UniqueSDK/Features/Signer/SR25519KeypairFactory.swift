//
//  SR25519KeypairFactory.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import IrohaCrypto

public protocol KeypairFactoryProtocol {
    func createKeypairFromSeed(_ seed: Data, chaincodeList: [Chaincode]) throws -> IRCryptoKeypairProtocol
}

public class SR25519KeypairFactory: KeypairFactoryProtocol {
   
    let internalFactory = SNKeyFactory()

    public init() {}
    
    public func createKeypairFromSeed(_ seed: Data,
                                      chaincodeList: [Chaincode]) throws -> IRCryptoKeypairProtocol {
        let masterKeypair = try internalFactory.createKeypair(fromSeed: seed)

        let parentKeypair = IRCryptoKeypair(publicKey: masterKeypair.publicKey(),
                                            privateKey: masterKeypair.privateKey())
        return try deriveChildKeypairFromParent(parentKeypair, chaincodeList: chaincodeList)
    }

    public func deriveChildKeypairFromParent(_ keypair: IRCryptoKeypairProtocol,
                                             chaincodeList: [Chaincode]) throws -> IRCryptoKeypairProtocol {
        let privateKey = try SNPrivateKey(rawData: keypair.privateKey().rawData())
        let publicKey = try SNPublicKey(rawData: keypair.publicKey().rawData())
        let snKeypair: SNKeypairProtocol = SNKeypair(privateKey: privateKey, publicKey: publicKey)

        let childKeypair = try chaincodeList.reduce(snKeypair) { (keypair, chaincode) in
            switch chaincode.type {
            case .soft:
                return try internalFactory.createKeypairSoft(keypair, chaincode: chaincode.data)
            case .hard:
                return try internalFactory.createKeypairHard(keypair, chaincode: chaincode.data)
            }
        }

        return IRCryptoKeypair(publicKey: childKeypair.publicKey(),
                               privateKey: childKeypair.privateKey())
    }
    
}

public enum ChaincodeType {
    case soft
    case hard
}

public struct Chaincode: Equatable {
    public let data: Data
    public let type: ChaincodeType

    public init(data: Data, type: ChaincodeType) {
        self.data = data
        self.type = type
    }
}
