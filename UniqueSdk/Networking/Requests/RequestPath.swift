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
        case balance = "/balance"
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
    
    enum Extrinsic: String, IPath {
        case extrinsic = "/extrinsic"
        case build = "/extrinsic/build"
        case sign = "/extrinsic/sign"
        case verifySign = "/extrinsic/verify-sign"
        case submit = "/extrinsic/submit"
        case calculateFee = "/extrinsic/calculate-fee"
        case status = "/extrinsic/status"
    }
    
    enum Fungible: String, IPath {
        case collection = "/fungible/collection"
        case balance = "/fungible/balance"
        case tokens = "/fungible/tokens"
        case tokensTransfer = "/fungible/tokens/transfer"
    }
    
    enum ERC721: String, IPath {
        case collection = "/erc721/collection"
        case token = "/erc721/token"
    }
    
    enum Evm: String, IPath {
        case send = "/evm/send"
        case call = "/evm/call"
    }
    
    enum Chain: String, IPath {
        case properties = "/chain/properties"
    }
    
    enum Common: String, IPath {
        case nonce = "/common/nonce"
        case chainProperties = "/common/chain-properties"
    }
    
    enum AddressUtils: String, IPath {
        case nestingTokenIdToAddress = "/address-utils/nesting/ids-to-address"
        case nestingAddressToCollection = "/address-utils/nesting/address-to-ids"
        case substrateToEthereum = "/address-utils/mirror/substrate-to-ethereum"
        case ethereumToSubstrate = "/address-utils/mirror/ethereum-to-substrate"
        case normalize = "/address-utils/normalize"
    }
    
    enum Refungible: String, IPath {
        case collection = "/refungible/collection"
        case balance = "/refungible/tokens/balance"
        case tokens = "/refungible/tokens"
        case transfer = "/refungible/tokens/transfer"
        case approve = "/refungible/tokens/approve"
        case allowance = "/refungible/tokens/allowance"
        case repartition = "/refungible/tokens/repartition"
        case totalPieces = "/refungible/tokens/total-pieces"
    }
}

