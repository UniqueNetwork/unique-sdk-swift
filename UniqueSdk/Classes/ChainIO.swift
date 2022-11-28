//
//  ChainIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public protocol IChainIO {
    func properties() async throws -> UNQChainPropertiesResponse
}

public class ChainIO: IChainIO {
    
    let networkClient: INetworkClient = NetworkClient()
    
    public func properties() async throws -> UNQChainPropertiesResponse {
        let request = CommonGetRequest(parameters: nil, path: RequestPath.Chain.properties.rawValue)
        return try await networkClient.send(request)
    }
}
