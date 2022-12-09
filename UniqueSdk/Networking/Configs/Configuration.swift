//
//  Configuration.swift
//  UniqueSDK
//
//  Created by Мах Ol on 19.10.2022.
//

import Foundation

enum ConfigKey: String {
    case environment = "Environment"
}

public final class Configuration {
    
    public static let shared = Configuration()
    
    private init() {}
    
    public var environment: Environment = .dev

    func apiUrl() -> URL {
        switch self.environment {
        case .local:
            return URL(string: "http://localhost:3000")!
        case .dev:
            return URL(string: "https://rest.opal.uniquenetwork.dev")!
        case .opal:
            return URL(string: "https://rest.unique.network/opal")!
        case .quartz:
            return URL(string: "https://rest.unique.network/quartz")!
        case .unique:
            return URL(string: "https://rest.unique.network/unique")!
        case .sapphire:
            return URL(string: "https://rest.unique.network/sapphire")!
        case .custom(let url):
            return URL(string: url)!
        }
    }
}

private enum PlistConfiguration {
    
    static func valueForKey<Value>(_ key: ConfigKey, default: Value) -> Value {
        return valueForKey(key) ?? `default`
    }
    
    private static func valueForKey<Value>(_ key: ConfigKey) -> Value? {
        return Bundle.main.infoDictionary?[key.rawValue] as? Value
    }
}
