//
//  ViewController.swift
//  UniqueSDKDemo
//
//  Created by Мах Ol on 19.10.2022.
//

import UIKit
import UniqueSDK
import IrohaCrypto


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
        let buildBody = BalanceTransferBody(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", destination: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", amount: 1)
                
        Unique.Balance.transferBuild(transferParameters: buildParameters, transferBody: buildBody) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let transaction):
                    self.signerPayloadJSON = transaction.signerPayloadJSON
                    self.signerPayloadRaw = transaction.signerPayloadRaw
                    self.signerPayloadHex = transaction.signerPayloadHex
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
    
    @IBAction func signAction(_ sender: Any) {
        signLocal()
    }
    
    func signRemote() {
        let signParameters = BalanceTransferParameters(use: .sign, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let signBody = BalanceTransferBody(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", destination: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", amount: 1)
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
    
    var step = 2
    var keyPairStep = 2
    
    func signLocal() {
        
        do {
        

            
            var data: Data = Data()
            

                data = Data(hex: signerPayloadHex)!

            
        let mnemonic: String = "quality battle ghost jazz muffin divide reflect salmon fee inform thank photo"
            
                let factory = SeedFactory(mnemonicLanguage: .english)
                var seedFactoryResult = try factory.deriveSeed(from: mnemonic, password: "")
                let bytes = [UInt8](seedFactoryResult.seed)
                print(bytes)
                let keyPairFactoryResult = try SR25519KeypairFactory().createKeypairFromSeed(seedFactoryResult.seed.prefix(32), chaincodeList: [])
                let bytesPub = [UInt8](keyPairFactoryResult.publicKey().rawData())
                print(bytesPub)
                let bytesPriv = [UInt8](keyPairFactoryResult.privateKey().rawData())
                print(bytesPriv)
                let signature = try SignWrapper().signSr25519(data, secretKeyData: keyPairFactoryResult.privateKey().rawData(), publicKeyData: keyPairFactoryResult.publicKey().rawData())
                self.signature = signature.toString()
                
            

    
        } catch (let error) {
            print(error)
        }
    }
        
    
    @IBAction func submitAction(_ sender: Any) {
        let submitParameters = BalanceTransferParameters(use: .submitWatch, withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let submitBody = BalanceTransferSubmitBody(signerPayloadJSON: self.signerPayloadJSON!, signerPayloadRaw: self.signerPayloadRaw!, signerPayloadHex: self.signerPayloadHex, signature: self.signature)
        
        Unique.Balance.transferSubmitWatch(transferParameters: submitParameters, transferBody: submitBody) { [weak self] result in
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

  

    }
    
    
}

