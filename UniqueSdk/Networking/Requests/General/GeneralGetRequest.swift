//
//  GeneralGetRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

struct GeneralGetRequest: IRequest {
    
    // MARK: - Properties
    
    private let requestParameters: [String: Encodable]?
    private let requestPath: String
    
    // MARK: - Initialization
    
    public init(parameters: [String: Encodable]?, path: String) {
        self.requestParameters = parameters
        self.requestPath = path
    }
    
    // MARK: - IRequest
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return requestPath
    }
    
    var parameters: [String: Encodable]? {
       return requestParameters
    }
}
