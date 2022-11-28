//
//  EvmIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public protocol IEvmIO {
    var send: Mutation<UNQEvmSendArguments> { get }
    var call: Mutation<UNQEvmCallArguments> { get }
}

public class EvmIO: IEvmIO {
    
    public var send = Mutation<UNQEvmSendArguments>(path: RequestPath.Evm.send.rawValue, method: .post)
    
    public var call = Mutation<UNQEvmCallArguments>(path: RequestPath.Evm.call.rawValue, method: .post)
}
