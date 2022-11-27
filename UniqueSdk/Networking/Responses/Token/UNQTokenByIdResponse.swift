//
//  TokenByIdResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 20.11.2022.
//

import Foundation

// MARK: - Welcome
public struct UNQTokenByIdResponse: Codable {
    public let attributes: [String: UNQDecodedAttribureDto]?
    public let collectionId: Int
    public let image: UNQDecodedInfixOrUrlOrCidAndHash?
    public let owner: String?
    public let tokenId: Int?
    public let audio: UNQDecodedInfixOrUrlOrCidAndHash?
    public let description: [String: String]?
    public let name: [String: String]?
    public let imagePreview: UNQDecodedInfixOrUrlOrCidAndHash?
    public let nestingParentToken: UNQNestingParentId?
    public let spatialObject: UNQDecodedInfixOrUrlOrCidAndHash?
    public let video: UNQDecodedInfixOrUrlOrCidAndHash?
    public let properties: [UNQTokenProperty]


}

public struct UNQTokenProperty: Codable {
    public let key: String
    public let value: String
}

public struct UNQDecodedAttribureDto: Codable {
    let name: [String: String]?
    let type: String
    let isArray: Bool
    let isEnum: Bool
    let rawValue: JSONAny
    let value: JSONAny
}

public struct UNQNestingParentId: Codable {
    public let collectionId: String
    public let tokenId: String
}

