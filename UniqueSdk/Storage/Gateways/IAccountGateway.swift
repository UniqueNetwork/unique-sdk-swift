//
//  IAccountGateway.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

protocol IAccountGateway {
    func add(_ account: UNQAccount)
    func load() -> [UNQAccount]
    func delete(_ account: UNQAccount)
}
