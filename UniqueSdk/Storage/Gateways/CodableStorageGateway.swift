//
//  CodableStorageGateway.swift
//  UniqueSDK
//
//  Created by Мах Ol on 02.11.2022.
//

import Foundation

public class CodableStorageGateway<T: Codable> {
    
    private let storage: IUserDefaultsStorage
    
    public init(key: String) {
        storage = UserDefaultsStorage(key: key)
    }
    
    public func setObjects(objects: [T]) {
        guard let data = try? JSONEncoder().encode(objects) else { return }
        
        storage.set(object: data)
    }
    
    public func getObjects() -> [T] {
        guard
            let data: Data = storage.get(),
            let objects = try? JSONDecoder().decode([T].self, from: data)
        else { return [] }
        
        return objects
    }
    
    public func delete() {
        storage.delete()
    }
}
