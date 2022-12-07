//
//  UNQFormData.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public struct UNQFormData {
    var name: String = ""
    public let fileName: String
    public let mimeType: String
    public let data: Data
    
    public init(fileName: String, mimeType: String, data: Data) {
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
    
    init(name: String, fileName: String, mimeType: String, data: Data) {
        self.name = name
        self.fileName = fileName
        self.mimeType = mimeType
        self.data = data
    }
}
