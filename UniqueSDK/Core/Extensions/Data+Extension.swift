//
//  Data+Extension.swift
//  UniqueSDK
//
//  Created by Мах Ol on 23.10.2022.
//

import Foundation
import CommonCrypto

public extension Data {
    
    var bytes: [UInt8] {
          return [UInt8](self)
    }
    
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return nil }

        return prettyPrintedString
    }
    
     init?(hex: String) {
        guard let hexData = hex.data(using: .ascii) else { return nil }
        guard hexData.count % 2 == 0 else { return nil }
        let prefix = hex.hasPrefix("0x") ? 2 : 0
        let result: Data? = hexData.withUnsafeBytes { hex in
            var result = Data()
            result.reserveCapacity((hexData.count - prefix) / 2)
            var current: UInt8? = nil
            for indx in prefix ..< hex.count {
                let v: UInt8
                switch hex[indx] {
                case let c where c <= 57: v = c - 48
                case let c where c >= 65 && c <= 70: v = c - 55
                case let c where c >= 97: v = c - 87
                default: return nil
                }
                if let val = current {
                    result.append(val << 4 | v)
                    current = nil
                } else {
                    current = v
                }
            }
            return result
        }
        guard let results = result else { return nil }
        self = results
    }

    func hex(prefix: Bool = true) -> String {
        return self.withUnsafeBytes { data in
            var result = Data()
            result.reserveCapacity(data.count * 2 + (prefix ? 2 : 0))
            if prefix {
                result.append(UInt8(ascii: "0"))
                result.append(UInt8(ascii: "x"))
            }
            Self._hexCharacters.withUnsafeBytes { hex in
                for byte in data {
                    result.append(hex[Int(byte >> 4)])
                    result.append(hex[Int(byte & 0x0F)])
                }
            }
            return String(bytes: result, encoding: .ascii)!
        }
    }
    

    private static let _hexCharacters = Data("0123456789abcdef".utf8)
}
