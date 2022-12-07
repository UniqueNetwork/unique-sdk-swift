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
    var transfer: Mutation<UNQTransferCollectionBody> { get }
    var setProperties: Mutation<UNQSetCollectionPropertiesBody> { get }
    var deleteProperties: Mutation<UNQDeleteCollectionPropertiesBody> { get }
    var setPropertyPermissions: Mutation<UNQSetPropertyPermissionsBody> { get }
    var setPermissions: Mutation<UNQSetCollectionPropertiesBody> { get }
    var setTransfersEnabled: Mutation<UNQSetTransfersEnabledBody> { get }
    var addToAllowList: Mutation<UNQAddToAllowListBody> { get }
    var addAdmin: Mutation<UNQAddCollectionAdminBody> { get }
    var removeAdmin: Mutation<UNQRemoveCollectionAdminBody> { get }
    var removeFromAllowList: Mutation<UNQRemoveFromAllowListBody> { get }
    var setSponsorship: Mutation<UNQSetSponsorshipBody> { get }
    var removeSponsorship: Mutation<UNQRemoveSponsorshipBody> { get }
    var confirmSponsorship: Mutation<UNQConfirmSponsorshipBody> { get }
    func get(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse
    func stats(hash: String?) async throws -> UNQGetStatsResponse
    func getLimits(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQEffectiveCollectionLimitsResponse
    func properties(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionPropertiesResponse
    func tokens(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQGetCollectionTokensResponse
    func propertyPermissions(propertyPermissionsQuery: UNQPropertyPermissionsQuery) async throws -> UNQPropertyPermissionsResponse
    func nextSponsored(nextSponsoredQuery: UNQNextSponsoredQuery) async throws -> NextSponsoredResponse
    func lastTokenId(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQLastTokenIdResult
    func allowList(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQAllowListBodyResult
    func allowed(allowedQuery: UNQAllowedQuery) async throws -> UNQAllowdResponse
    func admins(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQAdminListResponse
    func totalSupply(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQTotalSupplyResponse
}

public class ColletionIO: IColletionIO {
        
    let networkClient: INetworkClient = NetworkClient()
    
    public var creation = Mutation<UNQCreateColletionBody>(path: RequestPath.Collection.collections.rawValue, method: .post)
    
    public var destroy = Mutation<UNQDestroyCollectionBody>(path: RequestPath.Collection.collections.rawValue, method: .delete)
    
    public var setLimits = Mutation<UNQCollectionLimitsBody>(path: RequestPath.Collection.setLimits.rawValue, method: .post)
    
    public var transfer = Mutation<UNQTransferCollectionBody>(path: RequestPath.Collection.transfer.rawValue, method: .patch)
    
    public var setProperties = Mutation<UNQSetCollectionPropertiesBody>(path: RequestPath.Collection.properties.rawValue, method: .post)
    
    public var deleteProperties = Mutation<UNQDeleteCollectionPropertiesBody>(path: RequestPath.Collection.properties.rawValue, method: .delete)
    
    public var setPropertyPermissions = Mutation<UNQSetPropertyPermissionsBody>(path: RequestPath.Collection.propetyPermissions.rawValue, method: .post)
    
    public var setPermissions = Mutation<UNQSetCollectionPropertiesBody>(path: RequestPath.Collection.permissions.rawValue, method: .post)
    
    public var setTransfersEnabled = Mutation<UNQSetTransfersEnabledBody>(path: RequestPath.Collection.transfersEnabled.rawValue, method: .post)
    
    public var addToAllowList = Mutation<UNQAddToAllowListBody>(path: RequestPath.Collection.addToAllowList.rawValue, method: .post)
    
    public var addAdmin = Mutation<UNQAddCollectionAdminBody>(path: RequestPath.Collection.admins.rawValue, method: .post)
    
    public var removeAdmin = Mutation<UNQRemoveCollectionAdminBody>(path: RequestPath.Collection.admins.rawValue, method: .delete)
    
    public var removeFromAllowList = Mutation<UNQRemoveFromAllowListBody>(path: RequestPath.Collection.removeFromAllowList.rawValue, method: .post)
    
    public var setSponsorship = Mutation<UNQSetSponsorshipBody>(path: RequestPath.Collection.sponsorship.rawValue, method: .post)
    
    public var removeSponsorship = Mutation<UNQRemoveSponsorshipBody>(path: RequestPath.Collection.sponsorship.rawValue, method: .delete)

    public var confirmSponsorship = Mutation<UNQConfirmSponsorshipBody>(path: RequestPath.Collection.confirmSponsorship.rawValue, method: .post)
    
    public func get(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionInfoWithSchemaResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.collections.rawValue)
        return try await networkClient.send(request)
    }
    
    public func stats(hash: String?) async throws -> UNQGetStatsResponse {
        let request: IRequest = GeneralGetRequest(parameters: ["at": hash], path: RequestPath.Collection.stats.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getLimits(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQEffectiveCollectionLimitsResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.limits.rawValue)
        return try await networkClient.send(request)
    }
    
    public func properties(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQCollectionPropertiesResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.properties.rawValue)
        return try await networkClient.send(request)
    }
    
    public func tokens(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQGetCollectionTokensResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.tokens.rawValue)
        return try await networkClient.send(request)
    }
    
    public func propertyPermissions(propertyPermissionsQuery: UNQPropertyPermissionsQuery) async throws -> UNQPropertyPermissionsResponse {
        let request: IRequest = GeneralGetRequest(parameters: propertyPermissionsQuery.dictionary, path: RequestPath.Collection.propetyPermissions.rawValue)
        return try await networkClient.send(request)
    }
    
    public func nextSponsored(nextSponsoredQuery: UNQNextSponsoredQuery) async throws -> NextSponsoredResponse {
        let request: IRequest = GeneralGetRequest(parameters: nextSponsoredQuery.dictionary, path: RequestPath.Collection.nextSponsored.rawValue)
        return try await networkClient.send(request)
    }
    
    public func lastTokenId(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQLastTokenIdResult {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.lastTokenId.rawValue)
        return try await networkClient.send(request)
    }
    
    public func allowList(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQAllowListBodyResult {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.allowList.rawValue)
        return try await networkClient.send(request)
    }
    
    public func allowed(allowedQuery: UNQAllowedQuery) async throws -> UNQAllowdResponse {
        let request: IRequest = GeneralGetRequest(parameters: allowedQuery.dictionary, path: RequestPath.Collection.allowed.rawValue)
        return try await networkClient.send(request)
    }
    
    public func admins(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQAdminListResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.admins.rawValue)
        return try await networkClient.send(request)
    }
    
    public func totalSupply(collectionIdQuery: UNQCollectionIdQuery) async throws -> UNQTotalSupplyResponse {
        let request: IRequest = GeneralGetRequest(parameters: collectionIdQuery.dictionary, path: RequestPath.Collection.totalSupply.rawValue)
        return try await networkClient.send(request)
    }
}
