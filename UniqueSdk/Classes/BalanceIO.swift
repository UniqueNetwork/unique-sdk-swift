//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public protocol IBalanceIO {
    var transfer: Mutation<UNQBalanceTransferBody> { get }
    func get(address: String) async throws -> UNQAllBalancesResponse
}

public class BalanceIO: IBalanceIO {
    
    private let networkClient: INetworkClient = NetworkClient()
    
    public var transfer = Mutation<UNQBalanceTransferBody>(path: RequestPath.Balance.transfer.rawValue, method: .post)

    public func get(address: String) async throws -> UNQAllBalancesResponse {
        let request = GetBalanceRequest(address: address)
        return try await networkClient.send(request)
    }
}
