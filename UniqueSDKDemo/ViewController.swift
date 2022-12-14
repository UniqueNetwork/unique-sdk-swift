//
//  ViewController.swift
//  UniqueSDKDemo
//
//  Created by Мах Ol on 19.10.2022.
//

import UIKit
import UniqueSDK
import LocalAuthentication





class ViewController: UIViewController {
    
    @IBOutlet weak var accountNameTextField: UITextField!
    @IBOutlet weak var accountAddressTextField: UITextField!
    @IBOutlet weak var accountMnemonicTextField: UITextField!
    @IBOutlet weak var tokenCollectionIDTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Unique.setConfiguration(.opal)
        Unique.savePasscode("1234")
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        guard let name = accountNameTextField.text, let address = accountAddressTextField.text, let mnemonic = accountMnemonicTextField.text else { return }
        let account = UNQAccount(name: name, address: address, mnemonic: mnemonic)
        Unique.Account.addAccount(account)
    }
    
    @IBAction func createCollectionAction(_ sender: Any) {
        guard let account = Unique.Account.loadAccounts().first else { return }
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let body = UNQCreateColletionBody(mode: .nft,
                                          name: "Name",
                                          description: "Description",
                                          tokenPrefix: "TokenPrefix",
                                          sponsorship: nil,
                                          limits: nil,
                                          metaUpdatePermission: nil,
                                          permissions: nil,
                                          readOnly: false,
                                          address: account.address,
                                          schema: nil,
                                          properties: nil,
                                          tokenPropertyPermissions: nil)
        Task {
            do {
                let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters,
                                                                              body: body,
                                                                              account: account,
                                                                              userAuthenticationType: .biometric)
                print(result)
            } catch (let error) {
                print(error)
            }
        }
    }


    @IBAction func createTokenAction(_ sender: Any) {
        guard let text = tokenCollectionIDTextField.text, let collectionID = Int(text) else {return}
        guard let account = Unique.Account.loadAccounts().first else { return }
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let body = UNQCreateTokenBody(owner: account.address, data: nil, properties: nil, address: account.address, collectionId: collectionID)
        Task {
            do {
                let result = try await Unique.Token.create.submitWatch(parameters: buildParameters,
                                                                       body: body,
                                                                       account: account,
                                                                       userAuthenticationType: .biometric)
                print(result)
            } catch (let error) {
                print(error)
            }
        }

    }
    
   
}

