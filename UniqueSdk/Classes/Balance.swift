//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public class BalanceIO {
        
    private let networkClient: INetworkClient = NetworkClient()
    
    public func getBalance(address: String,
                           completion: @escaping (Result<UAllBalance, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceRequest(address: address)
        networkClient.send(request, completion: completion)
    }
    
    public func transfer(transferParameters: BalanceTransferParameters, transferBody: BalanceTransferBody, completion: @escaping (Result<>)) {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters, transferBody: transferBody)
        networkClient.send(request, completion: complete)
    }
    
}
