//
//  QueryRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

struct QueryRequest: IRequest {
    
    // MARK: - Properties
    
    private let requestParameters: UNQApiGetterParams
    private let requestBody: UNQApiRequestBody?
    private let requestMethod: HTTPMethod
   
    
    // MARK: - Initialization
    
    public init(parameters: UNQApiGetterParams, body: UNQApiRequestBody?, method: HTTPMethod) {
        self.requestParameters = parameters
        self.requestBody = body
        self.requestMethod = method
    }
    
    // MARK: - IRequest
    
    var method: HTTPMethod {
        return requestMethod
    }
    
    var path: String {
        return "/query/\(requestParameters.endpoint)/\(requestParameters.module)/\(requestParameters.method)"
    }
    
    var body: Data? {
        guard let body = requestBody else { return nil }
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}
