//
//  FungibleIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public protocol IFungibleIO {
    var createCollection: Mutation<UNQCreateFungibleCollectionRequest> { get }
    var addTokens: Mutation<UNQAddTokensArgs> { get }
    var transferTokens: Mutation<UNQTransferTokensArgs> { get }

    func getCollection(parameters: UNQGetFungibleBalanceArgsRequest) async throws -> UNQFungibleCollectionInfo
    func getBalance(parameters: UNQCollectionIdQuery) async throws -> UNQBalanceResponse
}

public class FungibleIO: IFungibleIO {
    
    let networkClient: INetworkClient = NetworkClient()

    public var createCollection = Mutation<UNQCreateFungibleCollectionRequest>(path: RequestPath.Fungible.collection.rawValue, method: .post)
    
    public var addTokens = Mutation<UNQAddTokensArgs>(path: RequestPath.Fungible.tokens.rawValue, method: .post)
    
    public var transferTokens = Mutation<UNQTransferTokensArgs>(path: RequestPath.Fungible.tokensTransfer.rawValue, method: .post)
    
    public func getCollection(parameters: UNQGetFungibleBalanceArgsRequest) async throws -> UNQFungibleCollectionInfo {
        let request: IRequest = CommonGetRequest(parameters: parameters.dictionary, path: RequestPath.Fungible.collection.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getBalance(parameters: UNQCollectionIdQuery) async throws -> UNQBalanceResponse {
        let request: IRequest = CommonGetRequest(parameters: parameters.dictionary, path: RequestPath.Fungible.balance.rawValue)
        return try await networkClient.send(request)
    }
}
