//
//  ColletionIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 10.11.2022.
//

import Foundation

public protocol IColletionIO {
    var creation: Mutation<UNQCreateColletionBody> { get }
    func createCollection(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, parameters: UNQRequestParameters, body: UNQCreateColletionBody, completion: @escaping ((Result<SubmitResponse, Error>) -> Void))
}

public class ColletionIO: IColletionIO {
    
    let networkClient = NetworkClient()
    
  public var creation = Mutation<UNQCreateColletionBody>(path: RequestPath.Collection.create.rawValue)
    
   private func createCollectionBuild(parameters: UNQRequestParameters,
                                      body: UNQCreateColletionBody) async throws -> UnsignedTxPayloadResponse
    {
        let request: IRequest = CollectionCreateBuildRequest(parameters: parameters,
                                                             body: body)
        return try await networkClient.send(request)
    }
    
   private func createCollectionSubmitWatch(parameters: UNQRequestParameters,
                                            body: UNQSubmitBody) async throws -> SubmitResponse
    {
        let request: IRequest = CollectionCreateSubmitWatchRequest(parameters: parameters,
                                                                   body: body)
        return try await networkClient.send(request)
    }
    
    public func createCollection(account: UNQAccount, userAuthenticationType: UNQUserAuthenticationType, parameters: UNQRequestParameters, body: UNQCreateColletionBody, completion: @escaping ((Result<SubmitResponse, Error>) -> Void)) {
        Task {
            do {
                let response = try await createCollectionBuild(parameters: parameters,
                                                               body: body)
                guard let data = Data(hex: response.signerPayloadHex) else { throw NSError() }
                let signature = try await Signer().sign(account: account,
                                                        userAuthenticationType: userAuthenticationType,
                                                        data: data)
                
                var submitParameters = parameters
                submitParameters.use = .submitWatch
                let body = UNQSubmitBody(signerPayloadJSON: response.signerPayloadJSON,
                                                            signerPayloadRaw: response.signerPayloadRaw,
                                                            signerPayloadHex: response.signerPayloadHex,
                                                            signature: signature)
                let submit = try await createCollectionSubmitWatch(parameters: submitParameters, body: body)
                completion(.success(submit))
            } catch (let error) {
                completion(.failure(error))
            }
        }
    }
}
