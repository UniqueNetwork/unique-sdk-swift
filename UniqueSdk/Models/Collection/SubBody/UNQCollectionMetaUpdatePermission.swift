//
//  UNQCollectionMetaUpdatePermission.swift
//  UniqueSDK
//
//  Created by Мах Ol on 10.11.2022.
//

import Foundation

public enum UNQCollectionMetaUpdatePermission: String, Codable {
    case itemOwner = "ItemOwner"
    case admin = "Admin"
    case none = "None"
}
