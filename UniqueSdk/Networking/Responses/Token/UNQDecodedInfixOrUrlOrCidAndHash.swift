//
//  UNQDecodedInfixOrUrlOrCidAndHash.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public struct UNQDecodedInfixOrUrlOrCidAndHash: Codable {
    public let fullUrl: String?
    public let urlInfix: String?
    public let url: String?
    public let ipfsCid: String?
    public let hash: String?
}
