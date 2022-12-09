//
//  QueryIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public protocol IQueryIO {
    func get(parameters: UNQApiGetterParams) async throws -> UNQAny
    func execute(parameters: UNQApiGetterParams, body: UNQApiRequestBody) async throws -> UNQAny
}

public class QueryIO: IQueryIO {
    
    let networkClient: INetworkClient = NetworkClient()

    public func get(parameters: UNQApiGetterParams) async throws -> UNQAny {
        let request = QueryRequest(parameters: parameters, body: nil, method: .get)
        return try await networkClient.send(request)
    }
    
    public func execute(parameters: UNQApiGetterParams, body: UNQApiRequestBody) async throws -> UNQAny {
        let request = QueryRequest(parameters: parameters, body: body, method: .post)
        return try await networkClient.send(request)
    }
}
