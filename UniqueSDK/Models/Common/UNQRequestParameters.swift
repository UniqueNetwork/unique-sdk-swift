//
//  Balanceparameters.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public struct UNQRequestParameters: Codable {
    var use: UseType
    public let withFee: Bool?
    public let verify: Bool?
    public let callbackUrl: String?
    public let nonce: Int?
    
    public init(withFee: Bool?, verify: Bool?, callbackUrl: String?, nonce: Int?) {
        self.use = .build
        self.withFee = withFee
        self.verify = verify
        self.callbackUrl = callbackUrl
        self.nonce = nonce
    }
    
    init(use: UseType, withFee: Bool?, verify: Bool?, callbackUrl: String?, nonce: Int?) {
        self.use = use
        self.withFee = withFee
        self.verify = verify
        self.callbackUrl = callbackUrl
        self.nonce = nonce
    }
}
