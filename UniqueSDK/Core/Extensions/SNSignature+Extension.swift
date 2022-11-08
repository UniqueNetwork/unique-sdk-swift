//
//  SNSignature+Extension.swift
//  UniqueSDK
//
//  Created by Мах Ol on 26.10.2022.
//

import Foundation
import IrohaCrypto

public extension SNSignature {
    
     func toString() -> String {
         self.rawData()
        let hexStr = NSData(data: self.rawData()).toHexString()
        let str = "0x01\(hexStr)"
        return str
    }
}
