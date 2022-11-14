//
//  Mutation.swift
//  UniqueSDK
//
//  Created by Мах Ol on 11.11.2022.
//

import Foundation

public class Mutation<B: Codable> {
    
    let networkClient: INetworkClient = NetworkClient()
    let path: String
    var bos: [B] = []
    
    init(path: String) {
        self.path = path
    }
    
    public func build<B: Codable>(parameters: UNQRequestParameters, body: B) async throws -> UnsignedTxPayloadResponse {
        var buildParameters = parameters
        buildParameters.use = .build
        let request: IRequest = MutationRequest<B>(parameters: buildParameters, body: body, path: path)
        return try await networkClient.send(request)
    }
    
    public func sign<B: Codable>(parameters: UNQRequestParameters, body: B, account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType) async throws -> SignResponse {
        let buildResponse = try await build(parameters: parameters, body: body)
        guard let data = Data(hex: buildResponse.signerPayloadHex) else { throw NSError() }
        let signer = Signer()
        let signature = try await signer.sign(account: account, userAuthenticationType: userAuthenticationType, data: data)
        return SignResponse(signature: signature, signerPayloadJSON: buildResponse.signerPayloadJSON, fee: buildResponse.fee)
    }
    
    public func sign(parameters: UNQRequestParameters, body: UnsignedTxPayloadResponse, account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType) async throws -> SignResponse {
        guard let data = Data(hex: body.signerPayloadHex) else { throw NSError() }
        let signer = Signer()
        let signature = try await signer.sign(account: account, userAuthenticationType: userAuthenticationType, data: data)
        return SignResponse(signature: signature, signerPayloadJSON: body.signerPayloadJSON, fee: body.fee)
    }
    
    public func submitWatch<B: Codable>(parameters: UNQRequestParameters,
                                        body: B,
                                        account: UNQAccount,
                                        userAuthenticationType: UNQUserAuthenticationType) async throws -> SubmitResponse
    {
        let buildResponse = try await build(parameters: parameters, body: body)
        guard let data = Data(hex: buildResponse.signerPayloadHex) else { throw NSError() }
        
        let signature = try await Signer().sign(account: account,
                                                userAuthenticationType: userAuthenticationType,
                                                data: data)
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let submitBody = UNQSubmitTxBody(signerPayloadJSON: buildResponse.signerPayloadJSON,
                                       signerPayloadRaw: buildResponse.signerPayloadRaw,
                                       signerPayloadHex: buildResponse.signerPayloadHex,
                                       signature: signature)
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: submitBody, path: path)
        return try await networkClient.send(request)
    }
    
    public func submitWatch(parameters: UNQRequestParameters,
                            body: UnsignedTxPayloadResponse,
                            account: UNQAccount,
                            userAuthenticationType: UNQUserAuthenticationType) async throws -> SubmitResponse
    {
        guard let data = Data(hex: body.signerPayloadHex) else { throw NSError() }
        
        let signature = try await Signer().sign(account: account,
                                                userAuthenticationType: userAuthenticationType,
                                                data: data)
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let submitBody = UNQSubmitTxBody(signerPayloadJSON: body.signerPayloadJSON,
                                       signerPayloadRaw: body.signerPayloadRaw,
                                       signerPayloadHex: body.signerPayloadHex,
                                       signature: signature)
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: submitBody, path: path)
        return try await networkClient.send(request)
    }
    
    public func submitWatch(parameters: UNQRequestParameters,
                            body: UNQSubmitTxBody,
                            account: UNQAccount,
                            userAuthenticationType: UNQUserAuthenticationType) async throws -> SubmitResponse
    {
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: body, path: path)
        return try await networkClient.send(request)
    }
    
}
