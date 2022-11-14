//
//  CollectionCreateSubmitWatchRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 11.11.2022.
//

import Foundation

struct CollectionCreateSubmitWatchRequest: IRequest {
    
    // MARK: - Properties
    
    private let requestParameters: UNQRequestParameters
    private let requestBody: UNQSubmitBody
    
    // MARK: - Initialization
    
    public init(parameters: UNQRequestParameters, body: UNQSubmitBody) {
        self.requestParameters = parameters
        self.requestBody = body
    }
    
    // MARK: - IRequest
    
    public var method: HTTPMethod {
        return .post
    }
    
    public var path: String {
        return "/collections"
    }
    
    public var parameters: [String: Encodable]? {
        return [
            "use": requestParameters.use.rawValue,
            "withFee": requestParameters.withFee,
            "verify": requestParameters.verify,
            "callbackUrl": requestParameters.callbackUrl,
            "nonce": requestParameters.nonce
        ]
    }
    
    public var body: Data? {
        do {
                let jsonData = try JSONEncoder().encode(requestBody)
                let jsonString = String(data: jsonData, encoding: .utf8)!
            return jsonData
        } catch {
            print(error)
            return nil
        }
    }
}
