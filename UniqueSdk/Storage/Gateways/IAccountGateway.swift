//
//  IAccountGateway.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

protocol IAccountGateway {
    func add(_ account: Account)
    func load() -> [Account]
    func delete(_ account: Account)
}
