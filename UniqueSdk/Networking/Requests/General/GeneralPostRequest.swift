//
//  GeneralPostRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 25.11.2022.
//

import Foundation

struct GeneralPostRequest<T: Codable>: IRequest {
    
    // MARK: - Properties
    
    private let requestBody: T
    private let requestPath: String
    
    // MARK: - Initialization
    
    public init(body: T, path: String) {
        self.requestBody = body
        self.requestPath = path
    }
    
    // MARK: - IRequest
    
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return requestPath
    }
    
    var body: Data? {
        do {
            let jsonData = try JSONEncoder().encode(requestBody)
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}
