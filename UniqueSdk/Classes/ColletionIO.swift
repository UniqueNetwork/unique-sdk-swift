//
//  ColletionIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 10.11.2022.
//

import Foundation

public protocol IColletionIO {
    var creation: Mutation<UNQCreateColletionBody> { get }
    var destroy: Mutation<UNQDestroyCollectionBody> { get }
    var setLimits: Mutation<UNQCollectionLimitsBody> { get }
    func get(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse
    func stats(hash: String?) async throws -> UNQGetStatsResponse
    func getLimits(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQEffectiveCollectionLimitsResponse
}

public class ColletionIO: IColletionIO {
        
    let networkClient: INetworkClient = NetworkClient()
    
    public var creation = Mutation<UNQCreateColletionBody>(path: RequestPath.Collection.collections.rawValue, method: .post)
    
    public var destroy = Mutation<UNQDestroyCollectionBody>(path: RequestPath.Collection.collections.rawValue, method: .delete)
    
    public var setLimits = Mutation<UNQCollectionLimitsBody>(path: RequestPath.Collection.setLimits.rawValue, method: .post)
    
    public func get(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse {
        let request: IRequest = CommonGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.collections.rawValue)
        return try await networkClient.send(request)
    }
    
    public func stats(hash: String?) async throws -> UNQGetStatsResponse {
        let request: IRequest = CollectionGetStatsRequest(hash: hash)
        return try await networkClient.send(request)
    }
    
    public func getLimits(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQEffectiveCollectionLimitsResponse {
        let request: IRequest = CommonGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.limits.rawValue)
        return try await networkClient.send(request)
    }
}
