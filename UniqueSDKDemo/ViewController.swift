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
        
        Task {
            do {
               let res = try await Unique.Collection.get(collectionIdQuery: UNQCollectionIdQuery(at: nil, collectionId: 1773))
                print(res)
            } catch(let error) {
                print( error )
            }
        }
    }
    
    @IBAction func SignAction(_ sender: Any) {
        print(Unique.Account.loadAccounts().first)
        guard let account = Unique.Account.loadAccounts().first else { return }
        Unique.savePasscode("123")
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        let body = UNQCreateColletionBody(mode: .nft, name: "asd", description: "13123", tokenPrefix: "gggggg", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)
        Task {
            do {
                let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters, body: body, account: account, userAuthenticationType: .biometric)
                print("result = \(result)")
            } catch (let error) {
                print(error)
            }
        }
        
    }
    
    @IBAction func SubmitWatchAction(_ sender: Any) {
     
        destroyCollection()
        
    }
    
    func destroyCollection() {
        guard let account = Unique.Account.loadAccounts().first else { return }

        let params = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let body = UNQDestroyCollectionBody(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: 1728)
        Task {
            do {
                let result = try await Unique.Collection.destroy.submitWatch(parameters: params, body: body, account: account, userAuthenticationType: .biometric)
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

