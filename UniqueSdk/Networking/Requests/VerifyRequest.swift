//
//  BalanceTransferSubmitRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

class VerifyRequest: IRequest {

// MARK: - Properties

private let verifyBody: VerifyBody

// MARK: - Initialization

public init(verifyBody: VerifyBody) {
    self.verifyBody = verifyBody
}

// MARK: - IRequest

//public var headers: [String : String]? {
//    return ["Seed //Bob": "Authorization"]
//}

public var method: HTTPMethod {
    return .post
}

public var path: String {
    return "/extrinsic/verify-sign"
}

public var body: Data? {
    do {
            let jsonData = try JSONEncoder().encode(verifyBody)
        print(jsonData.prettyPrintedJSONString)
        return jsonData
    } catch {
        print(error)
        return nil
    }
}
}
