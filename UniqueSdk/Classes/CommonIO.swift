//
//  CommonIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public protocol ICommonIO {
    func getNonce(address: String) async throws -> UNQGetNonceResponse
    func chainProperties() async throws -> UNQChainPropertiesResponse
}

public class CommonIO: ICommonIO {
    
    let networkClient: INetworkClient = NetworkClient()
    
    public func getNonce(address: String) async throws -> UNQGetNonceResponse {
        let request = GeneralGetRequest(parameters: ["address": address], path: RequestPath.Common.nonce.rawValue)
        return try await networkClient.send(request)
    }
    
    public func chainProperties() async throws -> UNQChainPropertiesResponse {
        let request = GeneralGetRequest(parameters: nil, path: RequestPath.Common.chainProperties.rawValue)
        return try await networkClient.send(request)
    }
}
