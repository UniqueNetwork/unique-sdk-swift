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
    let method: HTTPMethod
    
    init(path: String, method: HTTPMethod) {
        self.path = path
        self.method = method
    }
    
    public func build(parameters: UNQRequestParameters, body: B) async throws -> UNQUnsignedTxPayloadResponse {
        var buildParameters = parameters
        buildParameters.use = .build
        let request: IRequest = MutationRequest<B>(parameters: buildParameters, body: body, path: path, method: method)
        return try await networkClient.send(request)
    }
    
    public func sign(parameters: UNQRequestParameters, body: B, account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType) async throws -> UNQSignResponse {
        let buildResponse = try await build(parameters: parameters, body: body)
        guard let data = Data(hex: buildResponse.signerPayloadHex) else { throw NSError() }
        let signer = Signer()
        let signature = try await signer.sign(account: account, userAuthenticationType: userAuthenticationType, data: data)
        return UNQSignResponse(signature: signature, signerPayloadJSON: buildResponse.signerPayloadJSON, fee: buildResponse.fee)
    }
    
    public func sign(parameters: UNQRequestParameters, body: UNQUnsignedTxPayloadResponse, account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType) async throws -> UNQSignResponse {
        guard let data = Data(hex: body.signerPayloadHex) else { throw NSError() }
        let signer = Signer()
        let signature = try await signer.sign(account: account, userAuthenticationType: userAuthenticationType, data: data)
        return UNQSignResponse(signature: signature, signerPayloadJSON: body.signerPayloadJSON, fee: body.fee)
    }
    
    public func submitWatch(parameters: UNQRequestParameters,
                                        body: B,
                                        account: UNQAccount,
                                        userAuthenticationType: UNQUserAuthenticationType) async throws -> UNQSubmitResponse
    {
        let buildResponse = try await build(parameters: parameters, body: body)
        guard let data = Data(hex: buildResponse.signerPayloadHex) else { throw NSError() }
        
        let signature = try await Signer().sign(account: account,
                                                userAuthenticationType: userAuthenticationType,
                                                data: data)
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let submitBody = UNQSubmitTxBody(signerPayloadJSON: buildResponse.signerPayloadJSON,
                                         signature: signature)
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: submitBody, path: path, method: method)
        return try await networkClient.send(request)
    }
    
    public func submitWatch(parameters: UNQRequestParameters,
                            body: UNQUnsignedTxPayloadResponse,
                            account: UNQAccount,
                            userAuthenticationType: UNQUserAuthenticationType) async throws -> UNQSubmitResponse
    {
        guard let data = Data(hex: body.signerPayloadHex) else { throw NSError() }
        
        let signature = try await Signer().sign(account: account,
                                                userAuthenticationType: userAuthenticationType,
                                                data: data)
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let submitBody = UNQSubmitTxBody(signerPayloadJSON: body.signerPayloadJSON,
                                         signature: signature)
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: submitBody, path: path, method: method)
        return try await networkClient.send(request)
    }
    
    public func submitWatch(parameters: UNQRequestParameters,
                            body: UNQSubmitTxBody,
                            account: UNQAccount,
                            userAuthenticationType: UNQUserAuthenticationType) async throws -> UNQSubmitResponse
    {
        var submitParameters = parameters
        submitParameters.use = .submitWatch
        let request: IRequest = MutationRequest<UNQSubmitTxBody>(parameters: submitParameters, body: body, path: path, method: method)
        return try await networkClient.send(request)
    }
    
}
