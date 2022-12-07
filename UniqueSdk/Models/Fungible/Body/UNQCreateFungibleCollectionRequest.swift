//
//  UNQCreateFungibleCollectionRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQCreateFungibleCollectionRequest

public struct UNQCreateFungibleCollectionRequest: Codable {
    public let mode: UNQColletionMode?
    public let name: String
    public let description: String
    public let tokenPrefix: String
    public let sponsorship: UNQCollectionSponsorship?
    public let limits: UNQCollectionLimits?
    public let metaUpdatePermission: UNQCollectionMetaUpdatePermission?
    public let permissions: UNQCollectionPermissions?
    public let readOnly: Bool?
    public let address: String
    public let schema: UNQCollectionSchemaToCreate?
    public let properties: [UNQCollectionProperty]?
    public let tokenPropertyPermissions: [UNQPropertyKeyPermission]?
    public let decimals: Int
    
    public init(mode: UNQColletionMode?,
                name: String,
                description: String,
                tokenPrefix: String,
                sponsorship: UNQCollectionSponsorship?,
                limits: UNQCollectionLimits?,
                metaUpdatePermission: UNQCollectionMetaUpdatePermission?,
                permissions: UNQCollectionPermissions?,
                readOnly: Bool?,
                address: String,
                schema: UNQCollectionSchemaToCreate?,
                properties: [UNQCollectionProperty]?,
                tokenPropertyPermissions: [UNQPropertyKeyPermission]?,
                decimals: Int)
    {
        self.mode = mode
        self.name = name
        self.description = description
        self.tokenPrefix = tokenPrefix
        self.sponsorship = sponsorship
        self.limits = limits
        self.metaUpdatePermission = metaUpdatePermission
        self.permissions = permissions
        self.readOnly = readOnly
        self.address = address
        self.schema = schema
        self.properties = properties
        self.tokenPropertyPermissions = tokenPropertyPermissions
        self.decimals = decimals
    }
}
