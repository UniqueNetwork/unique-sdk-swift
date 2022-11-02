//
//  UserDefaultsStorage.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

internal final class UserDefaultsStorage: IUserDefaultsStorage {
    
    private let defaults = UserDefaults.standard
    private let key: String
    
    init(key: String) {
        self.key = key
    }

    func set<T>(object: T?) {
        defaults.set(object, forKey: key)
    }

    func get<T>() -> T? {
        return defaults.object(forKey: key) as? T
    }

    func delete() {
        defaults.set(nil, forKey: key)
    }
}
