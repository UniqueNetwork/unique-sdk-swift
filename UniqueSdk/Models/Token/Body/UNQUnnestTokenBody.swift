//
//  UNQUnnestTokenBody.swift
//  UniqueSDK
//
//  Created by Мах Ol on 22.11.2022.
//

import Foundation

public struct UNQUnnestTokenBody: Codable {
    public let address: String
    public let parent: UNQNestedTokenObject
    public let nested: UNQNestedTokenObject
    public let value: Int?

    public init(address: String, parent: UNQNestedTokenObject, nested: UNQNestedTokenObject, value: Int?) {
        self.address = address
        self.parent = parent
        self.nested = nested
        self.value = value
    }
}

