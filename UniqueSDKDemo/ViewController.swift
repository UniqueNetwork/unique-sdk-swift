//
//  ViewController.swift
//  UniqueSDKDemo
//
//  Created by Мах Ol on 19.10.2022.
//

import UIKit
import UniqueSDK
import IrohaCrypto
import LocalAuthentication





class ViewController: UIViewController {
    
    @IBOutlet weak var buildButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBAction func buildAction(_ sender: Any) {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")

let buildBody = UNQCreateColletionBody(mode: nil, name: "test", description: "asdasd", tokenPrefix: "asdasd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)
        Unique.Collection.createCollection(account: account, userAuthenticationType: .biometric, parameters: buildParameters, body: buildBody) { res in
            switch res {
            case .success(let suc):
                print(suc)
            case .failure(let error):
                print(error)
            }
        }
        
//        Unique.Balance.transfer(account: account, userAuthenticationType: .biometric, parameters: buildParameters, transferBody: buildBody) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let transaction):
//                   print(transaction.hash)
//
//
//                case .failure(let error):
//                    print("Поймали ошибку")
//                    print(error)
//                }
//            }
//        }
    }
    
    
    @IBAction func createAccountAction(_ sender: Any) {
        
       let accaunt = UNQAccount(name: "1", address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", mnemonic: "quality battle ghost jazz muffin divide reflect salmon fee inform thank photo")
        Unique.Account.addAccount(accaunt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Unique.Account.loadAccounts().forEach {
            Unique.Account.deleteAccount($0)
        }
  

    }
    
    
}

