//
//  UNQCreateTokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public struct UNQCreateTokenBody: Codable {
    /// владелец коллекции
    public let owner: String
    ///вкладываемая дата
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
    public let attributes: [String: JSONAny]?
    public let encodedAttributes: [String: JSONAny]?
    public let name: [String: String]?
    public let audio: UNQEncodedInfixOrUrlOrCidAndHash?
    public let description: [String: String]?
    public let imagePreview: UNQEncodedInfixOrUrlOrCidAndHash?
    public let spatialObject: UNQEncodedInfixOrUrlOrCidAndHash?
    public let video: UNQEncodedInfixOrUrlOrCidAndHash?
    
    public init(image: UNQEncodedInfixOrUrlOrCidAndHash, attributes: [String: JSONAny]?, encodedAttributes: [String: JSONAny]?, name: [String: String]?, audio: UNQEncodedInfixOrUrlOrCidAndHash?, description: [String: String]?, imagePreview: UNQEncodedInfixOrUrlOrCidAndHash?, spatialObject: UNQEncodedInfixOrUrlOrCidAndHash?, video: UNQEncodedInfixOrUrlOrCidAndHash?)
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
