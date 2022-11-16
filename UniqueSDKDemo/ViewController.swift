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
                1780
                
                let res = try await Unique.Collection.propertyPermissions(propertyPermissionsQuery: .init(collectionId: 1782, propertyKeys: nil, at: nil))
                
//                let res = try await Unique.Collection.setProperties.submitWatch(parameters: buildParameters, body: .init(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: "1782", properties: [UNQCollectionProperty(key: "aaaa", value: "bbbbb"), UNQCollectionProperty(key: "111111", value: "22222222")]), account: account, userAuthenticationType: .biometric)
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

        let body = UNQCreateColletionBody(mode: .nft, name: "asd", description: "13123", tokenPrefix: "gggggg", sponsorship: nil, limits: .init(accountTokenOwnershipLimit: 2048, sponsoredDataSize: nil, sponsoredDataRateLimit: nil, tokenLimit: nil, sponsorTransferTimeout: nil, sponsorApproveTimeout: nil, ownerCanTransfer: true, ownerCanDestroy: true, transfersEnabled: true), metaUpdatePermission: nil, permissions: nil, readOnly: false, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)
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

