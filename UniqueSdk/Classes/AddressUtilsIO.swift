//
//  AddressUtilsIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public protocol IAddressUtilsIO {
    func nestingTokenIdToAddress(parameters: UNQTokenIdQuery) async throws -> UNQNestingAddress
    func nestingAddressToCollection(address: String) async throws -> UNQTokenIdQuery
    func substrateToEthereum(address: String) async throws -> UNQEthereumAddress
    func ethereumToSubstrate(address: String) async throws -> UNQAddress
    func normalize(parameters: UNQAddressWithPrefixQuery) async throws -> UNQAddress
}

public class AddressUtilsIO: IAddressUtilsIO {
    
    let networkClient: INetworkClient = NetworkClient()

    public func nestingTokenIdToAddress(parameters: UNQTokenIdQuery) async throws -> UNQNestingAddress {
        let request = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.AddressUtils.nestingTokenIdToAddress.rawValue)
        return try await networkClient.send(request)
    }
    
    public func nestingAddressToCollection(address: String) async throws -> UNQTokenIdQuery {
        let request = GeneralGetRequest(parameters: ["address": address], path: RequestPath.AddressUtils.nestingAddressToCollection.rawValue)
        return try await networkClient.send(request)
    }
    
    public func substrateToEthereum(address: String) async throws -> UNQEthereumAddress {
        let request = GeneralGetRequest(parameters: ["address": address], path: RequestPath.AddressUtils.substrateToEthereum.rawValue)
        return try await networkClient.send(request)
    }
    
    public func ethereumToSubstrate(address: String) async throws -> UNQAddress {
        let request = GeneralGetRequest(parameters: ["address": address], path: RequestPath.AddressUtils.ethereumToSubstrate.rawValue)
        return try await networkClient.send(request)
    }
    
    public func normalize(parameters: UNQAddressWithPrefixQuery) async throws -> UNQAddress {
        let request = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.AddressUtils.normalize.rawValue)
        return try await networkClient.send(request)
    }
}
