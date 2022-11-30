//
//  IRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 19.10.2022.
//

import Foundation

// Признак того, что запрос в авторизованной зоне (с токеном)
public protocol IPrivateRequest {}

public protocol IRequest {
    var path: String { get }
    var headers: [String: String]? { get }
    var method: HTTPMethod { get }
    var parameters: [String: Encodable]? { get }
    var body: Data? { get }
    var source: String? { get }
    var apiVersion: String? { get }

    func buildUrlRequest() -> URLRequest
}

public extension IRequest {
    
    var headers: [String: String]? {
        return ["application/json": "Content-Type"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Encodable]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
    
    var source: String? {
        return nil
    }
    
    var apiVersion: String? {
        return "/v1"
    }
}

public extension IRequest {
    
    func buildUrlRequest() -> URLRequest {
        let url = UrlBuilder()
            .version(apiVersion)
            .path(path)
            .build()
        
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }
        
        if let parameters = parameters {
            components.queryItems = buildQueryParameters(with: parameters)
        }
        
        guard let requestUrl = components.url else {
            fatalError("Unable to create URL")
        }
        print("requestURL = \(requestUrl)")

        var request = URLRequest(url: requestUrl)
        request.httpMethod = method.rawValue
        request.httpBody = body
        print("requestBody = \(body?.prettyPrintedJSONString)")
        if let headers = headers, !headers.isEmpty {
            headers.forEach {
                request.setValue($0, forHTTPHeaderField: $1)
            }
        }    
        return request
    }
    
    private func buildQueryParameters(with dictionary: [String: Encodable]) -> [URLQueryItem]? {
            let items = dictionary.compactMap({ keyValue -> [URLQueryItem?] in
                guard let value = keyValue.value as? CustomStringConvertible, !value.description.isEmpty else {
                    return []
                }
                if let array = keyValue.value as? [CustomStringConvertible] {
                    let query = array.map { URLQueryItem(name: keyValue.key, value: $0.description) }
                    return query
                }
                return [URLQueryItem(name: keyValue.key, value: value.description)]
            })
            return items.flatMap { $0 }.compactMap { $0 }
    }
    
    private func buildBodyParametres(with dictionary: [String: Encodable]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
    }
}
