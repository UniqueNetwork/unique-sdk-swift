//
//  ExtrinsicStatusRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

struct ExtrinsicStatusRequest: IRequest {
    
    // MARK: - Properties
    
    private let hash: String
    
    // MARK: - Initialization
    
    public init(hash: String) {
        self.hash = hash
    }
    
    // MARK: - IRequest
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/extrinsic/status"
    }
    
    var parameters: [String: Encodable]? {
       return [
        "hash": hash
       ]
    }
}
