//
//  Sr25519Signature+Extension.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import Sr25519

public extension Sr25519Signature {
    
     func toString() -> String {
        let hexStr = self.raw.hex(prefix: false)
        let str = "0x01\(hexStr)"
        return str
    }
}
