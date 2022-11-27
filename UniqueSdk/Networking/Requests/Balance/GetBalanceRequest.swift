//
//  GetBalanceRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

struct GetBalanceRequest: IRequest {
    
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
        return "/balance"
    }
    
    var parameters: [String: Encodable]? {
       return [
        "address": address
       ]
    }
}
