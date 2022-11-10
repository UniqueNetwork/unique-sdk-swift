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
        let buildParameters = BalanceTransferParameters(use: .build, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let buildBody = BalanceTransferBody(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", destination: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", amount: 1)
        
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")

        
        Unique.Balance.transfer(account: account, userAuthenticationType: .biometric, transferParameters: buildParameters, transferBody: buildBody) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let transaction):
                   print(transaction.hash) 
                   
                    
                case .failure(let error):
                    print("Поймали ошибку")
                    print(error)
                }
            }
        }
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

