//
//  UNQAccount.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

public protocol IAccountIO {
    func loadAccounts() -> [UNQAccount]
    func addAccount(_ account: UNQAccount)
    func deleteAccount(_ account: UNQAccount)
    func testGetAccountMnemonic(account: UNQAccount) -> String
}

public class AccountIO: IAccountIO {
    
    public func loadAccounts() -> [UNQAccount] {
        return StorageGatewaysFactory.accounts.load()
    }
    
    public func addAccount(_ account: UNQAccount) {
        StorageGatewaysFactory.accounts.add(account)
    }
    
    public func deleteAccount(_ account: UNQAccount) {
        StorageGatewaysFactory.accounts.delete(account)
    }
    
    public func testGetAccountMnemonic(account: UNQAccount) -> String {
        KeychainService().loadFromKeychain(key: account.address) ?? ""
    }
    
}
