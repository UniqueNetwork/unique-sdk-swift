//
//  AccountGateway.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

class AccountGateway: CodableStorageGateway<UNQAccount>, IAccountGateway {
    
    func add(_ account: UNQAccount) {
       var accounts = getObjects()
        accounts.append(account)
        setObjects(objects: accounts)
    }
    
    func load() -> [UNQAccount] {
        return getObjects()
    }
    
    func delete(_ account: UNQAccount) {
        var accounts = getObjects()
        accounts.removeAll { $0.address == account.address }
        setObjects(objects: accounts)
    }
    
}

