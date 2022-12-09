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
    public let abi: [UNQAny]
    public let contractAddress: String
    public let funcName: String
    public let args: [UNQAny]?
    public let nonce: Int?
    public let value: UNQAny?
    public let gasLimit: UNQAny?
    public let maxFeePerGas: UNQAny?
    public let maxPriorityFeePerGas: UNQAny?

    public init(address: String, abi: [UNQAny], contractAddress: String, funcName: String, args: [UNQAny]?, nonce: Int?, value: UNQAny?, gasLimit: UNQAny?, maxFeePerGas: UNQAny?, maxPriorityFeePerGas: UNQAny?) {
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
