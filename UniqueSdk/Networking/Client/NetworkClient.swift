//
//  NetworkClient.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation

public protocol INetworkClient {
    func send<ResponseType: Codable>(_ request: IRequest,
                                     accessToken: String?,
                                     completion: @escaping (Result<ResponseType, NetworkRequestError>) -> Void)
    func send<ResponseType: Codable>(_ request: IRequest,
                                                 accessToken: String?) async throws -> ResponseType
}

public extension INetworkClient {
    
    func send<ResponseType: Codable>(_ request: IRequest,
                                     completion: @escaping (Result<ResponseType, NetworkRequestError>) -> Void) {
        send(request, accessToken: nil, completion: completion)
    }
    
    func send<ResponseType: Codable>(_ request: IRequest) async throws -> ResponseType {
        return try await send(request, accessToken: nil)
    }
}

public final class NetworkClient: INetworkClient {
    
    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public init() {}
    
    public func send<ResponseType: Codable>(_ request: IRequest,
                                                 accessToken: String?) async throws -> ResponseType  {
        if request is IPrivateRequest, accessToken == nil {
            let error = NetworkRequestError.tokenDoesntExist
            throw error
        }
        
        let urlRequest = createURLRequest(from: request, token: accessToken)
        let (data, response) = try await URLSessionProvider.urlSession.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkRequestError.invalidResponse
        }
            print("Response url \(String(describing: response.url?.absoluteString))")
            switch response.statusCode {
            case 200..<300:
                print()
                if data.isEmpty,
                   ResponseType.self is EmptyResponse.Type,
                   let response = EmptyResponse() as? ResponseType
                {
                    return response
                } else {
                    return try await decoding(data: data, responseType: ResponseType.self)
                }
            case 401:
                throw NetworkRequestError.tokenExpired(request)
            case let code:
                let exactError = self.processError(data, httpCode: code)
                throw exactError
            }
    }
    
    public func send<ResponseType: Codable>(_ request: IRequest,
                                            accessToken: String?,
                                            completion: @escaping (Result<ResponseType, NetworkRequestError>) -> Void) {
        if request is IPrivateRequest, accessToken == nil {
            let error = NetworkRequestError.tokenDoesntExist
            return completion(.failure(error))
        }
        
        let urlRequest = createURLRequest(from: request, token: accessToken)
        
        URLSessionProvider.urlSession.dataTask(with: urlRequest) { [weak self] data, response, error in
            var result: Result<ResponseType, NetworkRequestError> = .failure(.unknown)
            defer {
                completion(result)
            }
            guard let self = self else { return }
            
            if error != nil {
                if let response = response as? HTTPURLResponse, let data = data {
                    let exactError = self.processError(data, httpCode: response.statusCode)
                    result = .failure(exactError)
                } else {
                    result = .failure(.internetConnectionError)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                return
            }
            print("Response url \(String(describing: response.url?.absoluteString))")
            switch response.statusCode {
            case 200..<300:
                print()
                if data.isEmpty,
                   ResponseType.self is EmptyResponse.Type,
                   let response = EmptyResponse() as? ResponseType
                {
                    result = .success(response)
                } else {
                    result = self.decoding(data: data, responseType: ResponseType.self)
                }
            case 401:
                result = .failure(NetworkRequestError.tokenExpired(request))
            case let code:
                let exactError = self.processError(data, httpCode: code)
                result = .failure(exactError)
            }
        }
        .resume()
    }
    
    private func createURLRequest(from request: IRequest, token: String?) -> URLRequest {
        var urlRequest = request.buildUrlRequest()
        
        if request is IPrivateRequest, let accessToken = token {
            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        }
        
        return urlRequest
    }
    
    private func processError(_ data: Data, httpCode: Int) -> NetworkRequestError {
        if let errorModel = try? decoder.decode(ErrorModel.self, from: data) {
            print("Error response: \(data.prettyPrintedJSONString ?? "")")
            return NetworkRequestError.backendError(model: errorModel)
        } else {
            return NetworkRequestError.unknown
        }
    }
    
    private func decoding<ResponseType: Decodable>(data: Data, responseType: ResponseType.Type) async throws -> ResponseType {
        print("response: \(data.prettyPrintedJSONString ?? "")")
        do {
            let decoded = try decoder.decode(responseType, from: data)
            return decoded
        } catch let DecodingError.keyNotFound(key, context) {
            print("Could not find key \(key) in JSON: \(context.debugDescription)")
            throw NetworkRequestError.decodingFailed
        } catch let DecodingError.valueNotFound(type, context) {
            print("Could not find type \(type) in JSON: \(context.debugDescription)")
            throw NetworkRequestError.decodingFailed
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type \(type) in JSON: \(context.debugDescription), \(context.codingPath)")
            throw NetworkRequestError.decodingFailed
        } catch DecodingError.dataCorrupted(let context) {
            print("Data found to be corrupted in JSON: \(context.debugDescription), \(context.codingPath)")
            throw NetworkRequestError.decodingFailed
        } catch let error as NSError {
            print("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            throw NetworkRequestError.decodingFailed
        }
    }
    
    private func decoding<ResponseType: Decodable>(data: Data, responseType: ResponseType.Type) -> Result<ResponseType, NetworkRequestError> {
        let result: Result<ResponseType, NetworkRequestError>
        print("response: \(data.prettyPrintedJSONString ?? "")")
        do {
            let decoded = try self.decoder.decode(responseType, from: data)
            result = .success(decoded)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Could not find key \(key) in JSON: \(context.debugDescription)")
            result = .failure(.decodingFailed)
        } catch let DecodingError.valueNotFound(type, context) {
            print("Could not find type \(type) in JSON: \(context.debugDescription)")
            result = .failure(.decodingFailed)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type mismatch for type \(type) in JSON: \(context.debugDescription), \(context.codingPath)")
            result = .failure(.decodingFailed)
        } catch DecodingError.dataCorrupted(let context) {
            print("Data found to be corrupted in JSON: \(context.debugDescription), \(context.codingPath)")
            result = .failure(.decodingFailed)
        } catch let error as NSError {
            print("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            result = .failure(.decodingFailed)
        }
        return result
    }
}

public struct EmptyResponse: Codable{
}
