//
//  Encodable+Extension.swift
//  UniqueSDK
//
//  Created by Мах Ol on 15.11.2022.
//

import Foundation

extension Encodable {
    var dictionary: [String: String] {
        let serialized = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))
        guard let dict = serialized as? [String: Any] else { return [:] }
        let newdict = dict.compactMapValues {
            return String(describing: $0)
        }
        return newdict
    }
}
