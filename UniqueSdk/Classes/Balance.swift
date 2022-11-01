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
    
    public func transferBuild(transferParameters: BalanceTransferParameters,
                         transferBody: BalanceTransferBody,
                         completion: @escaping (Result<UnsignedTxPayloadResponse, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters,
                                                       transferBody: transferBody)
        networkClient.send(request, completion: completion)
    }
    
    public func transferSign(transferParameters: BalanceTransferParameters,
                         transferBody: BalanceTransferBody,
                         completion: @escaping (Result<SignResponse, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters,
                                                       transferBody: transferBody)
        networkClient.send(request, completion: completion)
    }
    
    public func transferSubmitWatch(transferParameters: BalanceTransferParameters,
                                    transferBody: BalanceTransferSubmitBody,
                                    completion: @escaping (Result<SubmitResponse, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceTransferSubmitRequest(transferParameters: transferParameters,
                                                             transferBody: transferBody)
        networkClient.send(request, completion: completion)
    }
    
    public func verify(verifyBody: VerifyBody, completion: @escaping (Result<VerifyResponse, NetworkRequestError>) -> Void) {
        
        let request: IRequest = VerifyRequest(verifyBody: verifyBody)
        
        networkClient.send(request, completion: completion)
    }
}
