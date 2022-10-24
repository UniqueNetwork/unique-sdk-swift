//
//  BalanceTransferRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

struct BalanceTransferRequest: IRequest {
    
    // MARK: - Properties
    
    private let transferParameters: BalanceTransferParameters
    private let transferBody: BalanceTransferBody
    
    // MARK: - Initialization
    
    public init(transferParameters: BalanceTransferParameters, transferBody: BalanceTransferBody) {
        self.transferParameters = transferParameters
        self.transferBody = transferBody
    }
    
    // MARK: - IRequest
    
    public var path: String {
        return "/balance/transfer"
    }
    
    public var parameters: [String: Encodable]? {
        return [
            "use": transferParameters.use,
            "withFee": transferParameters.withFee,
            "verify": transferParameters.verify,
            "callbackUrl": transferParameters.callbackUrl,
            "nonce": transferParameters.nonce
        ]
    }
}
