//
//  UNQFungibleCollectionInfo.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQFungibleCollectionInfo

public struct UNQFungibleCollectionInfo: Codable {
    public let mode: UNQColletionMode?
    public let name: String
    public let description: String
    public let tokenPrefix: String
    public let sponsorship: UNQCollectionSponsorship?
    public let limits: UNQCollectionLimits?
    public let metaUpdatePermission: UNQCollectionMetaUpdatePermission?
    public let permissions: UNQCollectionPermissions?
    public let readOnly: Bool?
    public let decimals: Int
    public let id: Int
    public let owner: String
}
