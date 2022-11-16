//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public protocol IBalanceIO {
    var transfer: Mutation<UNQBalanceTransferBody> { get }
    func getBalance(address: String,
                    completion: @escaping (Result<UNQBalance, NetworkRequestError>) -> Void)
}

public class BalanceIO: IBalanceIO {
    
    private let networkClient: INetworkClient = NetworkClient()
    
    public var transfer = Mutation<UNQBalanceTransferBody>(path: RequestPath.Balance.transfer.rawValue, method: .post)

    public func getBalance(address: String,
                           completion: @escaping (Result<UNQBalance, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceRequest(address: address)
        networkClient.send(request, completion: completion)
    }
}
