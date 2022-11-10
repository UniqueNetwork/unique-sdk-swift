//
//  Balance.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public protocol IBalanceIO {
    func getBalance(address: String,
                    completion: @escaping (Result<UNQBalance, NetworkRequestError>) -> Void)
    func transfer(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, parameters: UNQRequestParameters,
                  transferBody: UNQBalanceTransferBody,
                  completion: @escaping (Result<SubmitResponse, Error>) -> Void)
    
}

public class BalanceIO: IBalanceIO {
    
    private let networkClient: INetworkClient = NetworkClient()
    
    public func getBalance(address: String,
                           completion: @escaping (Result<UNQBalance, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceRequest(address: address)
        networkClient.send(request, completion: completion)
    }
    
   private func transferBuild(parameters: UNQRequestParameters,
                            transferBody: UNQBalanceTransferBody) async throws -> UnsignedTxPayloadResponse
    {
        let request: IRequest = BalanceTransferRequest(parameters: parameters,
                                                       transferBody: transferBody)
        return try await networkClient.send(request)
    }
    
   private func transferSubmitWatch(parameters: UNQRequestParameters,
                                  transferBody: SubmitBody) async throws -> SubmitResponse
    {
        let request: IRequest = BalanceTransferSubmitRequest(parameters: parameters,
                                                             transferBody: transferBody)
        return try await networkClient.send(request)
    }
    
    public func transfer(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, parameters: UNQRequestParameters, transferBody: UNQBalanceTransferBody, completion: @escaping (Result<SubmitResponse, Error>) -> Void) {
        
        Task {
            do {
                let response = try await transferBuild(parameters: parameters,
                                                            transferBody: transferBody)
                guard let data = Data(hex: response.signerPayloadHex) else { throw NSError() }
                let signature = try await Signer().sign(account: account,
                                                             userAuthenticationType: userAuthenticationType,
                                                             data: data)
                let submitParameters = UNQRequestParameters(use: .submitWatch,
                                                                 withFee: nil,
                                                                 verify: nil,
                                                                 callbackUrl: nil,
                                                                 nonce: nil)
                let balanceBody = SubmitBody(signerPayloadJSON: response.signerPayloadJSON,
                                                            signerPayloadRaw: response.signerPayloadRaw,
                                                            signerPayloadHex: response.signerPayloadHex,
                                                            signature: signature)
                let submit = try await transferSubmitWatch(parameters: submitParameters, transferBody: balanceBody)
                completion(.success(submit))
            } catch (let error) {
                completion(.failure(error))
            }
        }
    }
}
