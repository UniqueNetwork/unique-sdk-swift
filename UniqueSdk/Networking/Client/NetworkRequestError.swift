//
//  NetworkRequestError.swift
//  UniqueSDK
//
//  Created by Мах Ol on 20.10.2022.
//

import Foundation

public enum NetworkRequestError: Error {
    case tokenExpired(IRequest)
    case tokenDoesntExist
    case decodingFailed
    case customErrorCode(code: Int)
    case backendError(model: ErrorModel)
    case invalidUrlRequest
    case internetConnectionError
    case unknown
}

public struct ErrorModel: Codable {
    private var error: NetworkError
}

private struct NetworkError: Codable {
    var code: String
    var name: String
    var message: String

}
