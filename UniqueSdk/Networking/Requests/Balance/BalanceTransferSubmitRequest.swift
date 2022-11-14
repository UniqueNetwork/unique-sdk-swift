//
//  BalanceTransferSubmitRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

class BalanceTransferSubmitRequest: IRequest {

// MARK: - Properties

private let requestParameters: UNQRequestParameters
private let transferBody: UNQSubmitTxBody

// MARK: - Initialization

public init(parameters: UNQRequestParameters, transferBody: UNQSubmitTxBody) {
    self.requestParameters = parameters
    self.transferBody = transferBody
}

// MARK: - IRequest

//public var headers: [String : String]? {
//    return ["Seed //Bob": "Authorization"]
//}

public var method: HTTPMethod {
    return .post
}

public var path: String {
    return "/balance/transfer"
}

public var parameters: [String: Encodable]? {
    return [
        "use": requestParameters.use.rawValue,
        "withFee": requestParameters.withFee,
        "verify": requestParameters.verify,
        "callbackUrl": requestParameters.callbackUrl,
        "nonce": requestParameters.nonce
    ]
}

public var body: Data? {
    do {
            let jsonData = try JSONEncoder().encode(transferBody)
        print(jsonData.prettyPrintedJSONString)
        return jsonData
    } catch {
        print(error)
        return nil
    }
}
}
