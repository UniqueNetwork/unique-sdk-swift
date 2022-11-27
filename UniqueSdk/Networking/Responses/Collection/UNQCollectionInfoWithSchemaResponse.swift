//
//  UNQCollectionInfoWithSchemaResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//


// MARK: - Welcome
public struct UNQCollectionInfoWithSchemaResponse: Codable {
    public let mode: UNQColletionMode?
    public let name: String
    public let description: String
    public let tokenPrefix: String
    public let sponsorship: UNQCollectionSponsorship?
    public let limits: UNQCollectionLimits?
    public let metaUpdatePermission: UNQCollectionMetaUpdatePermission?
    public let permissions: UNQCollectionPermissions?
    public let readOnly: Bool?
    public let id: Int
    public let owner: String
    public let schema: UNQCollectionSchemaDecoded?
    public let properties: [UNQCollectionProperty]
    public let flags: UNQCollectionFlags
    public let tokenPropertyPermissions: [UNQPropertyKeyPermission]
}

// MARK: - Flags
public struct UNQCollectionFlags: Codable {
    public let foreign: Bool?
    public let erc721Metadata: Bool?

}

// MARK: - Schema
public struct UNQCollectionSchemaDecoded: Codable {
    public let attributesSchema: [String: UNQAttributeSchema]?
    public let attributesSchemaVersion: String?
    public let collectionId: Int
    public let coverPicture: UNQCoverPicture
    public let image: UNQCollectionSchemaImage
    public let schemaName: UNQSchemaName
    public let schemaVersion: String
    public let oldProperties: UNQOldProperties
    public let coverPicturePreview: UNQCoverPicture?
    public let imagePreview: UNQImagePreview?
    public let audio: UNQCollectionSchemaAudio?
    public let spatialObject: UNQSpatialObject?
    public let video: UNQCollectionSchemaVideo?

    public init(attributesSchema: [String: UNQAttributeSchema]?, attributesSchemaVersion: String?, collectionId: Int, coverPicture: UNQCoverPicture, image: UNQCollectionSchemaImage, schemaName: UNQSchemaName, schemaVersion: String, oldProperties: UNQOldProperties, coverPicturePreview: UNQCoverPicture, imagePreview: UNQImagePreview?, audio: UNQCollectionSchemaAudio?, spatialObject: UNQSpatialObject?, video: UNQCollectionSchemaVideo?) {
        self.attributesSchema = attributesSchema
        self.attributesSchemaVersion = attributesSchemaVersion
        self.collectionId = collectionId
        self.coverPicture = coverPicture
        self.image = image
        self.schemaName = schemaName
        self.schemaVersion = schemaVersion
        self.oldProperties = oldProperties
        self.coverPicturePreview = coverPicturePreview
        self.imagePreview = imagePreview
        self.audio = audio
        self.spatialObject = spatialObject
        self.video = video
    }
}


// MARK: - OldProperties
public struct UNQOldProperties: Codable {
    public let oldSchemaVersion: String
    public let oldOffchainSchema: String
    public let oldConstOnChainSchema: String
    public let oldVariableOnChainSchema: String
    
    enum CodingKeys: String, CodingKey {
            case oldSchemaVersion = "_old_schemaVersion"
            case oldOffchainSchema = "_old_offchainSchema"
            case oldConstOnChainSchema = "_old_constOnChainSchema"
            case oldVariableOnChainSchema = "_old_variableOnChainSchema"
        }
}

