//
//  CollectionGetStatsRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

struct CollectionGetStatsRequest: IRequest {
    
    // MARK: - Properties
    
    private let hash: String?
    
    // MARK: - Initialization
    
    public init(hash: String?) {
        self.hash = hash
    }
    
    // MARK: - IRequest
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var path: String {
        return "/collections/stats"
    }
    
    public var parameters: [String: Encodable]? {
        return [
            "at": hash
        ]
    }
}


