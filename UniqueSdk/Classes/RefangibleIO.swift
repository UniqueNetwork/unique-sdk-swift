//
//  RefangibleIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 12.12.2022.
//

import Foundation

public protocol IRefangibleIO {
    var createCollection: Mutation<UNQCreateRefungibleCollectionRequest> { get }
    var createToken: Mutation<UNQCreateRefungibleTokenRequest> { get }
    var transferToken: Mutation<UNQTransferRefungibleTokenRequest> { get }
    var approveToken: Mutation<UNQApproveRefungibleTokenRequest> { get }
    var repartitionToken: Mutation<UNQRepartitionTokenRequest> { get }

    func getCollection(parameters: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse
    func getBalance(parameters: UNQTokenBalanceQuery) async throws -> UNQTokenBalanceResponse
    func totalPieces(parameters: UNQTokenId) async throws -> UNQTotalPiecesResponse
    func allowanceToken(parameters: UNQAllowanceArgumentsQuery) async throws -> UNQAllowanceRefungibleTokenResponse
}

public class RefangibleIO: IRefangibleIO {
    
    let networkClient: INetworkClient = NetworkClient()
    
    public var createCollection = Mutation<UNQCreateRefungibleCollectionRequest>(path: RequestPath.Refungible.collection.rawValue, method: .post)
    
    public var createToken = Mutation<UNQCreateRefungibleTokenRequest>(path: RequestPath.Refungible.tokens.rawValue, method: .post)
    
    public var transferToken = Mutation<UNQTransferRefungibleTokenRequest>(path: RequestPath.Refungible.transfer.rawValue, method: .post)
    
    public var approveToken = Mutation<UNQApproveRefungibleTokenRequest>(path: RequestPath.Refungible.approve.rawValue, method: .post)
    
    public var repartitionToken = Mutation<UNQRepartitionTokenRequest>(path: RequestPath.Refungible.repartition.rawValue, method: .post)
    
    public func getCollection(parameters: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Refungible.collection.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getBalance(parameters: UNQTokenBalanceQuery) async throws -> UNQTokenBalanceResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Refungible.balance.rawValue)
        return try await networkClient.send(request)
    }
    
    public func totalPieces(parameters: UNQTokenId) async throws -> UNQTotalPiecesResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Refungible.totalPieces.rawValue)
        return try await networkClient.send(request)
    }
    
    public func allowanceToken(parameters: UNQAllowanceArgumentsQuery) async throws -> UNQAllowanceRefungibleTokenResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Refungible.allowance.rawValue)
        return try await networkClient.send(request)
    }
}
