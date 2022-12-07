//
//  UNQIpfsUploadResponse.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public struct UNQIpfsUploadResponse: Codable {
    public let cid: String
    public let fullUrl: String?
}
