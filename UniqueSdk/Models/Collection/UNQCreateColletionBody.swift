//
//  UNQCreateColletionBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 10.11.2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   public let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct UNQCreateColletionBody: Codable {
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
    public let schema: Schema?
    public let properties: [UNQCollectionProperty]?
    public let tokenPropertyPermissions: [UNQPropertyKeyPermission]?
    
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
                schema: Schema?,
                properties: [UNQCollectionProperty]?,
                tokenPropertyPermissions: [UNQPropertyKeyPermission]?)
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
    }
}

// MARK: - Limits
public struct UNQCollectionLimits: Codable {
    public let accountTokenOwnershipLimit: Int?
    public let sponsoredDataSize: Int?
    public let sponsoredDataRateLimit: Int?
    public let tokenLimit: Int?
    public let sponsorTransferTimeout: Int?
    public let sponsorApproveTimeout: Int?
    public let ownerCanTransfer: Bool?
    public let ownerCanDestroy: Bool?
    public let transfersEnabled: Bool?
    
    public init(accountTokenOwnershipLimit: Int?,
                sponsoredDataSize: Int?,
                sponsoredDataRateLimit: Int?,
                tokenLimit: Int?,
                sponsorTransferTimeout: Int?,
                sponsorApproveTimeout: Int?,
                ownerCanTransfer: Bool?,
                ownerCanDestroy: Bool?,
                transfersEnabled: Bool?)
    {
        self.accountTokenOwnershipLimit = accountTokenOwnershipLimit
        self.sponsoredDataSize = sponsoredDataSize
        self.sponsoredDataRateLimit = sponsoredDataRateLimit
        self.tokenLimit = tokenLimit
        self.sponsorTransferTimeout = sponsorTransferTimeout
        self.sponsorApproveTimeout = sponsorApproveTimeout
        self.ownerCanTransfer = ownerCanTransfer
        self.ownerCanDestroy = ownerCanDestroy
        self.transfersEnabled = transfersEnabled
    }
}

// MARK: - Permissions
public struct UNQCollectionPermissions: Codable {
    public let access: UNQCollectionPermissionAccess?
    public let mintMode: Bool?
    public let nesting: UNQCollectionNestingPermisson?
    
    public init(access: UNQCollectionPermissionAccess?, mintMode: Bool?, nesting: UNQCollectionNestingPermisson?) {
        self.access = access
        self.mintMode = mintMode
        self.nesting = nesting
    }
}

// MARK: - Nesting
public struct UNQCollectionNestingPermisson: Codable {
    public let tokenOwner: Bool?
    public let collectionAdmin: Bool?
    public let restricted: [Int]?
    
    public init(tokenOwner: Bool?, collectionAdmin: Bool?, restricted: [Int]?) {
        self.tokenOwner = tokenOwner
        self.collectionAdmin = collectionAdmin
        self.restricted = restricted
    }
}

// MARK: - Property
public struct UNQCollectionProperty: Codable {
    public let key: String
    public let value: String
    
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

// MARK: - Schema
public struct Schema: Codable {
    public let attributesSchema: [String: AttributesSchema]
    public let attributesSchemaVersion: String?
    public let coverPicture: UNQCoverPicture
    public let image: UNQImage
    public let schemaName: UNQCollectionSchemaName
    public let schemaVersion: String?
    public let coverPicturePreview: UNQCoverPicture?
    public let imagePreview: UNQImagePreview?
    public let audio: UNQAudio?
    public let spatialObject: UNQSpatialObject?
    public let video: UNQVideo?
    
    public init(attributesSchema: [String: AttributesSchema],
                attributesSchemaVersion: String?,
                coverPicture: UNQCoverPicture,
                image: UNQImage,
                schemaName: UNQCollectionSchemaName,
                schemaVersion: String?,
                coverPicturePreview: UNQCoverPicture?,
                imagePreview: UNQImagePreview?,
                audio: UNQAudio?,
                spatialObject: UNQSpatialObject?,
                video: UNQVideo?)
    {
        self.attributesSchema = attributesSchema
        self.attributesSchemaVersion = attributesSchemaVersion
        self.coverPicture = coverPicture
        self.image = image
        self.schemaName = schemaName
        self.schemaVersion = schemaVersion
        self.coverPicturePreview = coverPicturePreview
        self.imagePreview = imagePreview
        self.audio = audio
        self.spatialObject = spatialObject
        self.video = video
    }
}

// MARK: - AttributesSchema
public struct AttributesSchema: Codable {
    public let name: [String: String]
    public let optional: Bool?
    public let type: String
    public let enumValues: [String: Name]
    public let isArray: Bool?
    
    public init(name: [String: String], optional: Bool?, type: String, enumValues: [String: Name], isArray: Bool?) {
        self.name = name
        self.optional = optional
        self.type = type
        self.enumValues = enumValues
        self.isArray = isArray
    }
}

// MARK: - Name
public struct Name: Codable {
    public let empty: String
    
    enum CodingKeys: String, CodingKey {
        case empty = "_"
    }
}

// MARK: - Audio
public struct UNQAudio: Codable {
    public let urlTemplate: String?
    public let format: String
    public let isLossless: Bool
    
    public init(urlTemplate: String?, format: String, isLossless: Bool) {
        self.urlTemplate = urlTemplate
        self.format = format
        self.isLossless = isLossless
    }
}

// MARK: - CoverPicture
public struct UNQCoverPicture: Codable {
    public let urlInfix: String?
    public let url: String?
    public let ipfcCid: String?
    public let hash: String?
    
    public init(urlInfix: String?, url: String?, ipfcCid: String?, hash: String?) {
        self.urlInfix = urlInfix
        self.url = url
        self.ipfcCid = ipfcCid
        self.hash = hash
    }
}

// MARK: - Image
public struct UNQImage: Codable {
    public let urlTemplate: String
    
    public init(urlTemplate: String) {
        self.urlTemplate = urlTemplate
    }
}

public struct UNQVideo: Codable {
    public let urlTemplate: String
    
    public init(urlTemplate: String) {
        self.urlTemplate = urlTemplate
    }
}

// MARK: - UNQImagePreview
public struct UNQImagePreview: Codable {
    public let urlTemplate: String?
    
    public init(urlTemplate: String) {
        self.urlTemplate = urlTemplate
    }
}

// MARK: - SpatialObject
public struct UNQSpatialObject: Codable {
    public let urlTemplate: String?
    public let format: String
    
    public init(urlTemplate: String?, format: String) {
        self.urlTemplate = urlTemplate
        self.format = format
    }
}

// MARK: - Sponsorship
public struct UNQCollectionSponsorship: Codable {
    public let address: String
    public let isConfirmed: Bool
    
    public init(address: String, isConfirmed: Bool) {
        self.address = address
        self.isConfirmed = isConfirmed
    }
}

// MARK: - TokenPropertyPermission
public struct UNQPropertyKeyPermission: Codable {
    public let key: String
    public let permission: UNQPropertyPermission
    
    public init(key: String, permission: UNQPropertyPermission) {
        self.key = key
        self.permission = permission
    }
}

// MARK: - Permission
public struct UNQPropertyPermission: Codable {
    public let mutable: Bool
    public let collectionAdmin: Bool
    public let tokenOwner: Bool
    
    public init(mutable: Bool, collectionAdmin: Bool, tokenOwner: Bool) {
        self.mutable = mutable
        self.collectionAdmin = collectionAdmin
        self.tokenOwner = tokenOwner
    }
}
