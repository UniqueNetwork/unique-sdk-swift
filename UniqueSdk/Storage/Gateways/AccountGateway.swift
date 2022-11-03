//
//  AccountGateway.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

class AccountGateway: CodableStorageGateway<Account>, IAccountGateway {
    
    func add(_ account: Account) {
       var accounts = getObjects()
        accounts.append(account)
        setObjects(objects: accounts)
    }
    
    func load() -> [Account] {
        return getObjects()
    }
    
    func delete(_ account: Account) {
        var accounts = getObjects()
        accounts.removeAll { $0.address == account.address }
        setObjects(objects: accounts)
    }
    
}

