//
//  UNQEvmSendArguments.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

// MARK: - UNQEvmSendArguments

public struct UNQEvmSendArguments: Codable {
    public let address: String
    public let abi: [JSONAny]
    public let contractAddress: String
    public let funcName: String
    public let args: [JSONAny]?
    public let nonce: Int?
    public let value: JSONAny?
    public let gasLimit: JSONAny?
    public let maxFeePerGas: JSONAny?
    public let maxPriorityFeePerGas: JSONAny?

    public init(address: String, abi: [JSONAny], contractAddress: String, funcName: String, args: [JSONAny]?, nonce: Int?, value: JSONAny?, gasLimit: JSONAny?, maxFeePerGas: JSONAny?, maxPriorityFeePerGas: JSONAny?) {
        self.address = address
        self.abi = abi
        self.contractAddress = contractAddress
        self.funcName = funcName
        self.args = args
        self.nonce = nonce
        self.value = value
        self.gasLimit = gasLimit
        self.maxFeePerGas = maxFeePerGas
        self.maxPriorityFeePerGas = maxPriorityFeePerGas
    }
}
