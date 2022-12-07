//
//  TokenIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation

public protocol ITokenIO {
    var create: Mutation<UNQCreateTokenBody> { get }
    var burn: Mutation<UNQBurnTokenBody> { get }
    var createMultiple: Mutation<UNQCreateMultipleTokensBody> { get }
    var setProperties: Mutation<UNQSetTokenPropertiesBody> { get }
    var deleteProperties: Mutation<UNQDeleteTokenPropertiesBody> { get }
    var nest: Mutation<UNQNestTokenBody> { get }
    var unnest: Mutation<UNQUnnestTokenBody> { get }
    var transfer: Mutation<UNQTransferTokenBody> { get }
    var approve: Mutation<UNQApproveTokenBody> { get }

    func get(parameters: UNQTokenIdQuery) async throws -> UNQTokenByIdResponse
    func properties(parameters: UNQTokenIdQuery) async throws -> UNQTokenPropertiesResponse
    func accountTokens(parameters: UNQAccountTokensQuery) async throws -> UNQAccountTokensResponse
    func exists(parameters: UNQTokenIdQuery) async throws -> UNQTokenExistsResponse
    func children(parameters: UNQTokenIdQuery) async throws -> UNQTokenChildrenResponse
    func parent(parameters: UNQTokenIdQuery) async throws -> UNQTokenParentResponse
    func owner(parameters: UNQTokenIdQuery) async throws -> UNQTokenOwnerResponse
    func topmostOwner(parameters: UNQTokenIdQuery) async throws -> UNQTopmostTokenOwnerResponse
    func allowance(parameters: UNQAllowanceArgumentsQuery) async throws -> UNQAllowanceResultResponse
    func isBundle(parameters: UNQTokenIdQuery) async throws -> UNQIsBundleResponse
    func getBundle(parameters: UNQTokenIdQuery) async throws -> UNQGetBundleResponse
    func balance(parameters: UNQTokenBalanceQuery) async throws -> UNQTokenBalanceResponse
}

public class TokenIO: ITokenIO {
    
    let networkClient: INetworkClient = NetworkClient()
    
    public var create = Mutation<UNQCreateTokenBody>(path: RequestPath.Token.tokens.rawValue, method: .post)
    
    public var burn = Mutation<UNQBurnTokenBody>(path: RequestPath.Token.tokens.rawValue, method: .delete)
    
    public var createMultiple = Mutation<UNQCreateMultipleTokensBody>(path: RequestPath.Token.tokens.rawValue, method: .delete)
    
    public var setProperties = Mutation<UNQSetTokenPropertiesBody>(path: RequestPath.Token.properties.rawValue, method: .post)
    
    public var deleteProperties = Mutation<UNQDeleteTokenPropertiesBody>(path: RequestPath.Token.properties.rawValue, method: .delete)
    
    public var nest = Mutation<UNQNestTokenBody>(path: RequestPath.Token.nest.rawValue, method: .post)
    
    public var unnest = Mutation<UNQUnnestTokenBody>(path: RequestPath.Token.unnest.rawValue, method: .post)
    
    public var transfer = Mutation<UNQTransferTokenBody>(path: RequestPath.Token.transfer.rawValue, method: .patch)
    
    public var approve = Mutation<UNQApproveTokenBody>(path: RequestPath.Token.approve.rawValue, method: .post)

    public func get(parameters: UNQTokenIdQuery) async throws -> UNQTokenByIdResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.tokens.rawValue)
        return try await networkClient.send(request)
    }
    
    public func properties(parameters: UNQTokenIdQuery) async throws -> UNQTokenPropertiesResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.properties.rawValue)
        return try await networkClient.send(request)
    }
    
    public func accountTokens(parameters: UNQAccountTokensQuery) async throws -> UNQAccountTokensResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.accountTokens.rawValue)
        return try await networkClient.send(request)
    }
    
    public func exists(parameters: UNQTokenIdQuery) async throws -> UNQTokenExistsResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.exist.rawValue)
        return try await networkClient.send(request)
    }
    
    public func children(parameters: UNQTokenIdQuery) async throws -> UNQTokenChildrenResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.children.rawValue)
        return try await networkClient.send(request)
    }
    
    public func parent(parameters: UNQTokenIdQuery) async throws -> UNQTokenParentResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.parent.rawValue)
        return try await networkClient.send(request)
    }
    
    public func owner(parameters: UNQTokenIdQuery) async throws -> UNQTokenOwnerResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.owner.rawValue)
        return try await networkClient.send(request)
    }
    
    public func topmostOwner(parameters: UNQTokenIdQuery) async throws -> UNQTopmostTokenOwnerResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.topmost.rawValue)
        return try await networkClient.send(request)
    }
    
    public func allowance(parameters: UNQAllowanceArgumentsQuery) async throws -> UNQAllowanceResultResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.allowance.rawValue)
        return try await networkClient.send(request)
    }
    
    public func isBundle(parameters: UNQTokenIdQuery) async throws -> UNQIsBundleResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.isBundle.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getBundle(parameters: UNQTokenIdQuery) async throws -> UNQGetBundleResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.getBundle.rawValue)
        return try await networkClient.send(request)
    }
    
    public func balance(parameters: UNQTokenBalanceQuery) async throws -> UNQTokenBalanceResponse {
        let request: IRequest = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Token.balance.rawValue)
        return try await networkClient.send(request)
    }

}
