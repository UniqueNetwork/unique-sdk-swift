//
//  UnqAccount.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

public protocol IAccountIO {
    func loadAccounts() -> [Account]
    func addAccount(_ account: Account)
    func deleteAccount(_ account: Account)
    func testGetAccountMnemonic(account: Account) -> String
}

public class AccountIO: IAccountIO {
    
    public func loadAccounts() -> [Account] {
        return StorageGatewaysFactory.accounts.load()
    }
    
    public func addAccount(_ account: Account) {
        StorageGatewaysFactory.accounts.add(account)
    }
    
    public func deleteAccount(_ account: Account) {
        StorageGatewaysFactory.accounts.delete(account)
    }
    
    public func testGetAccountMnemonic(account: Account) -> String {
        KeychainService().loadFromKeychain(key: account.address) ?? ""
    }
    
}
