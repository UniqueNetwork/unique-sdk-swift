//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public protocol IBalanceIO {
    func getBalance(address: String,
                    completion: @escaping (Result<UAllBalance, NetworkRequestError>) -> Void)
    func transfer(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, transferParameters: BalanceTransferParameters,
                  transferBody: BalanceTransferBody,
                  completion: @escaping (Result<SubmitResponse, Error>) -> Void)
    
}

public class BalanceIO: IBalanceIO {
    
    private let networkClient: INetworkClient = NetworkClient()
    
    public func getBalance(address: String,
                           completion: @escaping (Result<UAllBalance, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceRequest(address: address)
        networkClient.send(request, completion: completion)
    }
    
    func transferBuild(transferParameters: BalanceTransferParameters,
                            transferBody: BalanceTransferBody) async throws -> UnsignedTxPayloadResponse
    {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters,
                                                       transferBody: transferBody)
        return try await networkClient.send(request)
    }
    
    func transferSubmitWatch(transferParameters: BalanceTransferParameters,
                                  transferBody: BalanceTransferSubmitBody) async throws -> SubmitResponse
    {
        let request: IRequest = BalanceTransferSubmitRequest(transferParameters: transferParameters,
                                                             transferBody: transferBody)
        return try await networkClient.send(request)
    }
    
    public func verify(verifyBody: VerifyBody, completion: @escaping (Result<VerifyResponse, NetworkRequestError>) -> Void) {
        
        let request: IRequest = VerifyRequest(verifyBody: verifyBody)
        
        networkClient.send(request, completion: completion)
    }
    
    public func transfer(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, transferParameters: BalanceTransferParameters, transferBody: BalanceTransferBody, completion: @escaping (Result<SubmitResponse, Error>) -> Void) {
        
        Task {
            do {
                let response = try await transferBuild(transferParameters: transferParameters,
                                                            transferBody: transferBody)
                guard let data = Data(hex: response.signerPayloadHex) else { throw NSError() }
                let signature = try await Signer().sign(account: account,
                                                             userAuthenticationType: userAuthenticationType,
                                                             data: data)
                let submitParameters = BalanceTransferParameters(use: .submitWatch,
                                                                 withFee: nil,
                                                                 verify: nil,
                                                                 callbackUrl: nil,
                                                                 nonce: nil)
                let balanceBody = BalanceTransferSubmitBody(signerPayloadJSON: response.signerPayloadJSON,
                                                            signerPayloadRaw: response.signerPayloadRaw,
                                                            signerPayloadHex: response.signerPayloadHex,
                                                            signature: signature)
                let submit = try await transferSubmitWatch(transferParameters: submitParameters, transferBody: balanceBody)
                completion(.success(submit))
            } catch (let error) {
                completion(.failure(error))
            }
        }
    }
}
