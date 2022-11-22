//
//  RequestPath.swift
//  UniqueSDK
//
//  Created by Мах Ol on 11.11.2022.
//

import Foundation

protocol IPath {
    var rawValue: String { get }
}

enum RequestPath {
    
    enum Balance: String, IPath {
        case transfer = "/balance/transfer"
    }
    
    enum Collection: String, IPath {
        case collections = "/collections"
        case stats = "/collections/stats"
        case limits = "/collections/limits"
        case setLimits = "/collections/set-limits"
        case transfer = "/collections/transfer"
        case properties = "/collections/properties"
        case tokens = "/collections/tokens"
        case propetyPermissions = "/collections/property-permissions"
        case permissions = "/collections/permissions"
        case transfersEnabled = "/collections/transfers-enabled"
        case nextSponsored = "/collections/next-sponsored"
        case lastTokenId = "/collections/last-token-id"
        case allowList = "/collections/allow-list"
        case addToAllowList = "/collections/add-to-allow-list"
        case allowed = "/collections/allowed"
        case admins = "/collections/admins"
        case removeFromAllowList = "/collections/remove-from-allow-list"
        case sponsorship = "/collections/sponsorship"
        case confirmSponsorship = "/collections/sponsorship/confirm"
        case totalSupply = "/collections/total-supply"
    }
    
    enum Token: String, IPath {
        case tokens = "/tokens"
        case multiple = "/tokens/create-multiple"
        case transfer = "/tokens/transfer"
        case nest = "/tokens/nest"
        case unnest = "/tokens/unnest"
        case children = "/tokens/children"
        case parent = "/tokens/parent"
        case owner = "/tokens/owner"
        case topmost = "/tokens/topmost-owner"
        case isBundle = "/tokens/is-bundle"
        case getBundle = "/tokens/get-bundle"
        case properties = "/tokens/properties"
        case accountTokens = "/tokens/account-tokens"
        case exist = "/tokens/exist"
        case approve = "/tokens/approve"
        case allowance = "/tokens/allowance"
        case balance = "/tokens/balance"
    }
}

