//
//  ExtrinsicIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public protocol IExtrinsicIO {
    
    func status(hash: String) async throws -> UNQExtrinsicResultResponse
    
}

public class ExtrinsicIO: IExtrinsicIO {
        
    let networkClient: INetworkClient = NetworkClient()
    
    public func status(hash: String) async throws -> UNQExtrinsicResultResponse {
        
        let request: IRequest = ExtrinsicStatusRequest(hash: hash)
        return try await networkClient.send(request)
    }
}
