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
    

    
    var unsignTxPayLoad: UnsignedTxPayloadResponse?
    var submitBody: UNQSubmitTxBody?
    var timer: Timer = Timer()
    var myHash: String = ""
    var collectionId: Int = 0
    var tokenId: Int = 0
    

    
    
    
    @IBAction func createCollectionAction(_ sender: Any) {
        guard let account = Unique.Account.loadAccounts().first else { return }
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        let body = UNQCreateColletionBody(mode: .nft, name: "asd", description: "13123", tokenPrefix: "asd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: false, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: nil, properties: nil, tokenPropertyPermissions: nil)
        Task {
            do {
                let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters, body: body, account: account, userAuthenticationType: .biometric)
                print("result = \(result)")
                
                myHash = result.hash
                let data = try await Unique.Extrinsic.status(hash: result.hash)
                
                timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

            } catch (let error) {
                print(error)
            }
        }
    }

    @objc func timerAction() {
        Task {
            let data = try await Unique.Extrinsic.status(hash: self.myHash)
           
            if data.isCompleted {
                print(data.parsed!.value)
                testConvert(data.parsed!.value)
                if let val = data.parsed?.value as? [String: Int?]  {
                    print("val = \(val)")
                    print("1")
                }
                
                if let val = data.parsed?.value as? [String: Int64]  {
                    print("val = \(val)")
                    print("2")

                }
                
                if let val = data.parsed?.value as? [String: Int64]?  {
                    print("val = \(val)")
                    print("3")
                    let i64 = val!["collectionId"]
                    collectionId = Int(i64!)

                }
                
                if let val = data.parsed!.value as? [String: String]  {
                    print("val = \(val)")
                }
                if let val = data.parsed!.value as? String  {
                    print("val = \(val)")
                }
                if let val = data.parsed!.value as? [String: JSONAny]  {
                    print("val = \(val)")
                }
                if let val = data.parsed?.value as? [String: Int]?  {
                    print("val = \(val)")
                }
                if let val = data.parsed!.value as? [String: Any]  {
                    print("val = \(val)")
                    print("value by key = \(val["collectionId"])")
                    let value = val["collectionId"]!
                    print("type = \(type(of: value))")
                    if let v = value as? Int {
                        print("v = \(v)")
                    }
                    
                    if let v = value as? Int? {
                        print("v = \(v)")
                    }

                }
                if let val = data.parsed!.value as? [String: Double]  {
                    print("val = \(val)")
                }
                if let val = data.parsed!.value as? [String: Float]  {
                    print("val = \(val)")
                }
                if let val = data.parsed!.value as? [String: Decimal]  {
                    print("val = \(val)")
                }
                

                timer.invalidate()
            }
        
            print(data.isCompleted)
        }
    }
    
    func testConvert(_ something: Any) {
        guard let dict = something as? [String: Any] else {
            print("\(something) couldn't be converted to Dictionary")
            return
        }
        print("\(something) successfully converted to Dictionary")
    }
    
    @IBAction func manageTokenAction(_ sender: Any) {
        guard let account = Unique.Account.loadAccounts().first else { return }
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        
        let body = UNQCreateTokenBody(owner: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", data: UNQTokenToCreateDto(image: .init(urlInfix: nil, url: "", ipfsCid: nil, hash: ""), attributes: ["1": JSONAny(value: "asdasd"), "2": JSONAny(value: "asdasd")], encodedAttributes: nil, name: nil, audio: nil, description: ["3": "123123"], imagePreview: nil, spatialObject: nil, video: nil), property: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: 89)
        Task {
            do {
                let result = try await Unique.Token.create.submitWatch(parameters: buildParameters, body: body, account: account, userAuthenticationType: .biometric)
                myHash = result.hash
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    @IBAction func getResultAction(_ sender: Any) {
        Task {
            do {
                let query = UNQTokenIdQuery(at: nil, collectionId: 89, tokenId: 4)
                let result = try await Unique.Token.get(parameters: query)
                print("result = \(result)")
            }// catch(let error) {
//                print(error)
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Unique.savePasscode("123")
        let accaunt = UNQAccount(name: "1", address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", mnemonic: "quality battle ghost jazz muffin divide reflect salmon fee inform thank photo")
         Unique.Account.addAccount(accaunt)
    }
    
    
}

