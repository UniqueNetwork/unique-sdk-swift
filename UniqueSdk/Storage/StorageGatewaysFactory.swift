//
//  UserDefaultsStorage.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

 enum StorageGatewaysFactory {
        
    static var accounts: IAccountGateway = {
        return AccountGateway(key: UserDefaultsKeys.account.rawValue)
    }()
}
