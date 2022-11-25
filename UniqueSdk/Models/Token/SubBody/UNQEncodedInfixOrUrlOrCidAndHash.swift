//
//  UNQEncodedInfixOrUrlOrCidAndHash.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public struct UNQEncodedInfixOrUrlOrCidAndHash: Codable {
    public let urlInfix: String?
    public let url: String?
    public let ipfsCid: String?
    public let hash: String?
    
    public init(urlInfix: String?, url: String?, ipfsCid: String?, hash: String?) {
        self.url = url
        self.urlInfix = urlInfix
        self.ipfsCid = ipfsCid
        self.hash = hash
    }
}
