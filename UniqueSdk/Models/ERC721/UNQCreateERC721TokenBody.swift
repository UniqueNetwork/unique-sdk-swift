//
//  UNQCreateERC721TokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQCreateERC721TokenBody

public struct UNQCreateERC721TokenBody: Codable {
    public let owner: String?
    public let properties: [UNQTokenProperty]?
    public let url: String?
    public let suffix: String?
    public let address: String
    public let collectionID: Int

    public init(owner: String?, properties: [UNQTokenProperty]?, url: String?, suffix: String?, address: String, collectionID: Int) {
        self.owner = owner
        self.properties = properties
        self.url = url
        self.suffix = suffix
        self.address = address
        self.collectionID = collectionID
    }
}

