//
//  BalanceRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.10.2022.
//

import Foundation

struct BalanceRequest: IRequest {
    
    // MARK: - Properties
    
    private let address: String
    
    // MARK: - Initialization
    
    public init(address: String) {
        self.address = address
    }
    
    // MARK: - IRequest
    
    public var path: String {
        return "/balance"
    }
    
    public var parameters: [String: Encodable]? {
        return [
            "address": address,
        ]
    }
}
