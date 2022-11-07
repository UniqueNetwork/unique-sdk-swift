//
//  Unique.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.10.2022.
//

import Foundation

public class Unique {
   public static let Balance: IBalanceIO = BalanceIO()
    public static let UNQAccount: IAccountIO = AccountIO()
    public static func savePasscode(_ passcode: String) {
        KeychainService().saveToKeycahin(key: Global.VerificationKey.key, value: passcode)
    }
}
