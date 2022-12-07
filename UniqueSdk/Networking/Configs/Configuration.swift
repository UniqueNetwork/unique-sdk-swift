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
    
    let environment: Environment = {
        return .local
    }()

    func apiUrl() -> URL {
        // swiftlint:disable force_unwrapping
        switch self.environment {
        case .local:
            return URL(string: "http://localhost:3000")!
        case .dev:
            return URL(string: "https://rest.opal.uniquenetwork.dev")!
        case .prod:
            return URL(string: "")!
        }
        // swiftlint:enable force_unwrapping
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
