//
//  IUserDefaultsStorage.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

protocol IUserDefaultsStorage {
    func set<T>(object: T?)
    func get<T>() -> T?
    func delete()
}
