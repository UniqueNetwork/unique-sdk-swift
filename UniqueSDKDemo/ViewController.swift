//
//  ViewController.swift
//  UniqueSDKDemo
//
//  Created by Мах Ol on 19.10.2022.
//

import UIKit
import UniqueSDK


class ViewController: UIViewController {
    
    @IBOutlet weak var buildButton: UIButton!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var balanceTransferSubmitBody: BalanceTransferSubmitBody?
    var signerPayloadJSON: SignerPayloadJSON?
    var signerPayloadRaw: SignerPayloadRaw?
    var signerPayloadHex: String = ""
    var signature: String = ""
    
    @IBAction func buildAction(_ sender: Any) {
        let buildParameters = BalanceTransferParameters(use: .build, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let buildBody = BalanceTransferBody(address: "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty", destination: "5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY", amount: 0.01)
        
        Unique.Balance.transferBuild(transferParameters: buildParameters, transferBody: buildBody) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let transaction):
                    print(transaction)
                    self.signerPayloadRaw = transaction.signerPayloadRaw
                    self.signerPayloadHex = transaction.signerPayloadHex
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    @IBAction func signAction(_ sender: Any) {
        let signParameters = BalanceTransferParameters(use: .sign, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let signBody = BalanceTransferBody(address: "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty", destination: "5GrwvaEF5zXb26Fz9rcQpDWS57CtERHpNehXCPcNoHGKutQY", amount: 0.01)
        Unique.Balance.transferSign(transferParameters: signParameters, transferBody: signBody) { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let transaction):
                    print(transaction)
                    signerPayloadJSON = transaction.signerPayloadJSON
                    signature = transaction.signature
                case .failure(let error):
                    print("Ошибка")
                    print(error)
                }
            }
        }
    }
    
    
    @IBAction func submitAction(_ sender: Any) {
        let submitParameters = BalanceTransferParameters(use: .submitWatch, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let submitBody = BalanceTransferSubmitBody(signerPayloadJSON: self.signerPayloadJSON!, signerPayloadRaw: self.signerPayloadRaw!, signerPayloadHex: self.signerPayloadHex, signature: self.signature)
        
        print(submitBody)
        Unique.Balance.transferSubmitWatch(transferParameters: submitParameters, transferBody: submitBody) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let transaction):
                    print(transaction)
                case .failure(let error):
                    print("Ошибка")
                    print(error)
                }
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        Unique.Balance.getBalance(address: "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty") { result in
        //            switch result {
        //            case .success(let balance):
        //                balance.availableBalance
        //                print("balance = \(balance)")
        //            case .failure(let error):
        //                print("error = \(error)")
        //            }
        //        }
    }
    
    
}

