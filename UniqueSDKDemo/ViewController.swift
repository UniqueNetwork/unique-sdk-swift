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
    
    
    var unsignTxPayLoad: UnsignedTxPayloadResponse?
    var submitBody: UNQSubmitTxBody?
    
    @IBAction func buildAction(_ sender: Any) {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")
        
        let alert = UIAlertController(title: "asdasd", message: "asdasd", preferredStyle: .alert)
        self.present(alert, animated: true)

let buildBody = UNQCreateColletionBody(mode: nil, name: "test", description: "asdasd", tokenPrefix: "asdasd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)
        
        Task {
            do {
                let result = try await Unique.Collection.creation.build(parameters: buildParameters, body: buildBody)
                self.unsignTxPayLoad = result
                self.submitBody = UNQSubmitTxBody(signerPayloadJSON: result.signerPayloadJSON, signerPayloadRaw: result.signerPayloadRaw, signerPayloadHex: result.signerPayloadHex, signature: "")
                print(result)
            } catch (let error) {
                print(error)
            }
        }
    }
    
    @IBAction func SignAction(_ sender: Any) {
        print(Unique.Account.loadAccounts().first)
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
//        let buildBody = UNQCreateColletionBody(mode: nil, name: "test", description: "asdasd", tokenPrefix: "asdasd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)

        Task {
            do {
                let result = try await Unique.Collection.creation.sign(parameters: buildParameters, body: unsignTxPayLoad!, account: account, userAuthenticationType: .biometric)
                self.submitBody?.signature = result.signature
                print("result = \(result)")
            } catch (let error) {
                print(error)
            }
        }
        
    }
    
    @IBAction func SubmitWatchAction(_ sender: Any) {
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
//        let buildBody = UNQCreateColletionBody(mode: nil, name: "test", description: "asdasd", tokenPrefix: "asdasd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)

        Task {
            do {
                let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters, body: submitBody!, account: account, userAuthenticationType: .biometric)
                print(result)
            } catch (let error) {
                print(error)
            }
        }
    }
    
    
    @IBAction func createAccountAction(_ sender: Any) {
        
       let accaunt = UNQAccount(name: "1", address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", mnemonic: "quality battle ghost jazz muffin divide reflect salmon fee inform thank photo")
        Unique.Account.addAccount(accaunt)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Unique.Account.loadAccounts().forEach {
//            Unique.Account.deleteAccount($0)
//        }
  

    }
    
    
}

