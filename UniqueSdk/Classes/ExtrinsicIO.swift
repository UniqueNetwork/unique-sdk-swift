//
//  ExtrinsicIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.11.2022.
//

import Foundation

public protocol IExtrinsicIO {
    
    func build(body: UNQTxBuildBody) async throws -> UNQUnsignedTxPayloadResponse
    func getFee(body: UNQTxBuildBody) async throws -> UNQFeeResponse
    func getFee(body: UNQUnsignedTxPayloadBody) async throws -> UNQFeeResponse
    func getFee(body: UNQSubmitTxBody) async throws -> UNQFeeResponse
    func sign(body: UNQUnsignedTxPayloadBody) async throws -> UNQSignTxResultResponse
    func sumbit(body: UNQSubmitTxBody) async throws -> UNQSubmitResultResponse
    func status(hash: String) async throws -> UNQExtrinsicResultResponse
    func get(parameters: UNQGetExtrinsicQuery) async throws -> UNQGetExtrinsicResponse
    
}

public class ExtrinsicIO: IExtrinsicIO {
    
    let networkClient: INetworkClient = NetworkClient()

    public func build(body: UNQTxBuildBody) async throws -> UNQUnsignedTxPayloadResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.build.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getFee(body: UNQTxBuildBody) async throws -> UNQFeeResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.calculateFee.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getFee(body: UNQUnsignedTxPayloadBody) async throws -> UNQFeeResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.calculateFee.rawValue)
        return try await networkClient.send(request)
    }
    
    public func getFee(body: UNQSubmitTxBody) async throws -> UNQFeeResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.calculateFee.rawValue)
        return try await networkClient.send(request)
    }
    
    public func sign(body: UNQUnsignedTxPayloadBody) async throws -> UNQSignTxResultResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.sign.rawValue)
        return try await networkClient.send(request)
    }
    
    public func sumbit(body: UNQSubmitTxBody) async throws -> UNQSubmitResultResponse {
        let request = GeneralPostRequest(body: body, path: RequestPath.Extrinsic.submit.rawValue)
        return try await networkClient.send(request)
    }
    
    public func get(parameters: UNQGetExtrinsicQuery) async throws -> UNQGetExtrinsicResponse {
        let request = GeneralGetRequest(parameters: parameters.dictionary, path: RequestPath.Extrinsic.extrinsic.rawValue)
        return try await networkClient.send(request)
    }
    
    public func status(hash: String) async throws -> UNQExtrinsicResultResponse {
        let request: IRequest = ExtrinsicStatusRequest(hash: hash)
        return try await networkClient.send(request)
    }
}
