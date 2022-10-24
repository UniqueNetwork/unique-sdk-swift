//
//  BalanceTransferSubmitRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

class BalanceTransferSubmitRequest: IRequest {

// MARK: - Properties

private let transferParameters: BalanceTransferParameters
private let transferBody: BalanceTransferSubmitBody

// MARK: - Initialization

public init(transferParameters: BalanceTransferParameters, transferBody: BalanceTransferSubmitBody) {
    self.transferParameters = transferParameters
    self.transferBody = transferBody
}

// MARK: - IRequest

public var headers: [String : String]? {
    return ["Seed //Bob": "Authorization"]
}

public var method: HTTPMethod {
    return .post
}

public var path: String {
    return "/balance/transfer"
}

public var parameters: [String: Encodable]? {
    return [
        "use": transferParameters.use!.rawValue,
        "withFee": transferParameters.withFee,
        "verify": transferParameters.verify,
        "callbackUrl": transferParameters.callbackUrl,
        "nonce": transferParameters.nonce
    ]
}

public var body: Data? {
    do {
            let jsonData = try JSONEncoder().encode(transferBody)
            let jsonString = String(data: jsonData, encoding: .utf8)!
        print(jsonString)
        return jsonData
    } catch {
        print(error)
        return nil
    }
}
}
