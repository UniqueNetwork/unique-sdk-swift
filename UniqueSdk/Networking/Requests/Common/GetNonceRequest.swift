//
//  GetNonceRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

struct GetNonceRequest: IRequest {
    
    // MARK: - Properties

    private let address: String
    
    // MARK: - Initialization
    
    public init(address: String) {
        self.address = address
    }
    
    // MARK: - IRequest
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/common/nonce"
    }
    
    var parameters: [String: Encodable]? {
       return ["address": address]
    }
}
