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
//    func transferBuild(transferParameters: BalanceTransferParameters,
//                       transferBody: BalanceTransferBody,
//                       completion: @escaping (Result<UnsignedTxPayloadResponse, NetworkRequestError>) -> Void)
//    func transferSign(transferParameters: BalanceTransferParameters,
//                      transferBody: BalanceTransferBody,
//                      completion: @escaping (Result<SignResponse, NetworkRequestError>) -> Void)
//    func transferSubmitWatch(transferParameters: BalanceTransferParameters,
//                             transferBody: BalanceTransferSubmitBody,
//                             completion: @escaping (Result<SubmitResponse, NetworkRequestError>) -> Void)
    func transfer(account: UNQAccount, transferParameters: BalanceTransferParameters,
                  transferBody: BalanceTransferBody,
                  completion: @escaping (Result<SubmitResponse, NetworkRequestError>) -> Void)
    
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
                              transferBody: BalanceTransferBody,
                              completion: @escaping (Result<UnsignedTxPayloadResponse, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters,
                                                       transferBody: transferBody)
        networkClient.send(request, completion: completion)
    }
    
    func transferSign(transferParameters: BalanceTransferParameters,
                             transferBody: BalanceTransferBody,
                             completion: @escaping (Result<SignResponse, NetworkRequestError>) -> Void)
    {
        let request: IRequest = BalanceTransferRequest(transferParameters: transferParameters,
                                                       transferBody: transferBody)
        networkClient.send(request, completion: completion)
    }
    
    func transferSubmitWatch(transferParameters: BalanceTransferParameters,
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
    
    public func transfer(account: UNQAccount, transferParameters: BalanceTransferParameters, transferBody: BalanceTransferBody, completion: @escaping (Result<SubmitResponse, NetworkRequestError>) -> Void) {
        
        self.transferBuild(transferParameters: transferParameters, transferBody: transferBody) { [weak self] result in
            if case let .success(response) = result {
                guard let data = Data(hex: response.signerPayloadHex) else {return}
                
                Signer().sign(account: account, data: data) { signRes in
                    if case let .success(signature) = signRes {
                        print("signature = \(signature)")
                        let submitParameters = BalanceTransferParameters(use: .submitWatch, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
                        let balanceBody = BalanceTransferSubmitBody(signerPayloadJSON: response.signerPayloadJSON, signerPayloadRaw: response.signerPayloadRaw, signerPayloadHex: response.signerPayloadHex, signature: signature)
                        self?.transferSubmitWatch(transferParameters: submitParameters, transferBody: balanceBody, completion: { secondRes in
                            switch secondRes {
                            case .success(let secondResponse):
                                completion(.success(secondResponse))
                            case .failure(let secondError):
                                completion(.failure(secondError))
                            }
                        })
                    }
                }
                
            }
            
            if case let .failure(error) = result {
                completion(.failure(error))
            }

        }
        
        
        //        networkClient.send(request) { [weak self] res in
//            switch result {
//            case .success(let suc):
//                suc
//            }
//        }
    }
}
