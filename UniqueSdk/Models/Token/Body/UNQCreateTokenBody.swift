//
//  UNQCreateTokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public struct UNQCreateTokenBody: Codable {
    public let owner: String
    public let data: UNQTokenToCreateDto?
    public let properties: UNQTokenProperty?
    public let address: String
    public let collectionId: Int
    
    public init(owner: String, data: UNQTokenToCreateDto?, properties: UNQTokenProperty?, address: String, collectionId: Int) {
        self.owner = owner
        self.data = data
        self.properties = properties
        self.address = address
        self.collectionId = collectionId
    }
}

public struct UNQTokenToCreateDto: Codable {
    public let image: UNQEncodedInfixOrUrlOrCidAndHash
    public let attributes: [String: UNQAny]?
    public let encodedAttributes: [String: UNQAny]?
    public let name: [String: String]?
    public let audio: UNQEncodedInfixOrUrlOrCidAndHash?
    public let description: [String: String]?
    public let imagePreview: UNQEncodedInfixOrUrlOrCidAndHash?
    public let spatialObject: UNQEncodedInfixOrUrlOrCidAndHash?
    public let video: UNQEncodedInfixOrUrlOrCidAndHash?
    
    public init(image: UNQEncodedInfixOrUrlOrCidAndHash, attributes: [String: UNQAny]?, encodedAttributes: [String: UNQAny]?, name: [String: String]?, audio: UNQEncodedInfixOrUrlOrCidAndHash?, description: [String: String]?, imagePreview: UNQEncodedInfixOrUrlOrCidAndHash?, spatialObject: UNQEncodedInfixOrUrlOrCidAndHash?, video: UNQEncodedInfixOrUrlOrCidAndHash?)
    {
        self.image = image
        self.attributes = attributes
        self.encodedAttributes = encodedAttributes
        self.name = name
        self.audio = audio
        self.description = description
        self.imagePreview = imagePreview
        self.spatialObject = spatialObject
        self.video = video
    }
    
}
