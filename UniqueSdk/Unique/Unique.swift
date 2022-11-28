//
//  Unique.swift
//  UniqueSDK
//
//  Created by Мах Ol on 21.10.2022.
//

import Foundation

public class Unique {
    public static let Token: ITokenIO = TokenIO()
    public static let Collection: IColletionIO = ColletionIO()
   public static let Balance: IBalanceIO = BalanceIO()
    public static let Account: IAccountIO = AccountIO()
    public static let Extrinsic: IExtrinsicIO = ExtrinsicIO()
    public static let Fungible: IFungibleIO = FungibleIO()
    public static let ERC721: IERC721IO = ERC721IO()
    public static func savePasscode(_ passcode: String) {
        KeychainService().saveToKeycahin(key: Global.VerificationKey.key, value: passcode)
    }
}
