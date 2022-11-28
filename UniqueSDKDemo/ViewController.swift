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
    

    
    var unsignTxPayLoad: UNQUnsignedTxPayloadResponse?
    var submitBody: UNQSubmitTxBody?
    var timer: Timer = Timer()
    var myHash: String = ""
    var collectionId: Int = 0
    var tokenId: Int = 0
    
    let account1 = UNQAccount(name: "1", address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", mnemonic: "quality battle ghost jazz muffin divide reflect salmon fee inform thank photo")
    let account2 = UNQAccount(name: "2", address: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", mnemonic: "shuffle exchange torch hood egg hammer first belt deer try inhale ginger")
    
    
    @IBAction func createCollectionAction(_ sender: Any) {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        let jsonAny1 = JSONAny(value: ["_": "Male"])
        let jsonAny2 = JSONAny(value: ["_": "Female"])

        let enumValues: [String: JSONAny] = [
            "0": jsonAny1,
            "1": jsonAny2
        ]
        let atr = UNQAttributeSchema(name: ["_": "gender"], optional: nil, type: "string", enumValues: enumValues, isArray: nil)
        let attributesSchema: [String: UNQAttributeSchema] = ["0": atr]
        let schema = UNQCollectionSchemaToCreate(attributesSchema: attributesSchema, attributesSchemaVersion: "1", coverPicture: UNQCoverPicture(urlInfix: "", url: nil, ipfcCid: nil, hash: ""), image: UNQCollectionSchemaImage(urlTemplate: "https://ipfs.unique.network/ipfs/{infix}.ext"), schemaName: UNQSchemaName.unique, schemaVersion: "1.0.0", coverPicturePreview: nil, imagePreview: nil, audio: nil, spatialObject: nil, video: nil)
        let body = UNQCreateColletionBody(mode: .nft, name: "asd", description: "13123", tokenPrefix: "asd", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: false, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", schema: schema, properties: nil, tokenPropertyPermissions: nil)
        Task {
            do {
                let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters, body: body, account: account1, userAuthenticationType: .biometric)
                print("result = \(result)")
                
                myHash = result.hash
                let data = try await Unique.Extrinsic.status(hash: result.hash)
                
                timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

            } catch (let error) {
                print(error)
            }
        }
    }
    
    @objc func createFungibleCollection() {
        guard let account = Unique.Account.loadAccounts().first else { return }
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        let body = UNQCreateERC721CollectionBody(mode: .fungible, name: "asdasd", description: "123123123", tokenPrefix: "test", sponsorship: nil, limits: nil, metaUpdatePermission: nil, permissions: nil, readOnly: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", baseURL: nil, properties: nil, tokenPropertyPermissions: nil)
        Task {
            do {
                let result = try await Unique.ERC721.createCollection.submitWatch(parameters: buildParameters, body: body, account: account, userAuthenticationType: .biometric)
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
                
                if let val = data.parsed?.value as? [String: Int64]?  {
                    print("val = \(val)")
                    print("3")
                    let i64 = val!["collectionId"]
                    collectionId = Int(i64!)
                }
                timer.invalidate()
            }
        
            print(data.isCompleted)
        }
    }
    
    @IBAction func manageTokenAction(_ sender: Any) {
        createFungibleCollection()
    }
    
    func getFungibleCollection() {
        Task {
            do {
                let query = UNQTokenIdQuery(at: nil, collectionId: 89, tokenId: 4)
                let result = try await Unique.Fungible.getCollection(parameters: .init(at: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: 258))
                print("result = \(result)")
            }// catch(let error) {
//                print(error)
//            }
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
    
    func createToken() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)

        let val: Int = 0
     
        let body = UNQCreateTokenBody(owner: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", data: UNQTokenToCreateDto(image: .init(urlInfix: "QmZJz9qCB5d8Bv9xz2rSCuX545Ux2UFEAdhUFmtpn5vPqD", url: nil, ipfsCid: nil, hash: ""), attributes: nil, encodedAttributes: ["0": .init(value: val)], name: nil, audio: nil, description: nil, imagePreview: nil, spatialObject: nil, video: nil), properties: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: 205)
        
        Task {
            do {
                let result = try await Unique.Token.create.submitWatch(parameters: buildParameters, body: body, account: account1, userAuthenticationType: .biometric)
                myHash = result.hash
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func transferToken() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        Task {
            do {
                let result = try await Unique.Token.transfer.submitWatch(parameters: buildParameters, body: .init(collectionId: 204, tokenId: 1, address: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", from: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", to: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", value: nil), account: account2, userAuthenticationType: .biometric)
                myHash = result.hash
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func nestToken() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        let body = UNQNestTokenBody(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", parent: .init(collectionId: 205, tokenId: 1), nested: .init(collectionId: 205, tokenId: 2), value: nil)
        Task {
            do {
                let result = try await Unique.Token.nest.submitWatch(parameters: buildParameters, body: body, account: account1, userAuthenticationType: .biometric)
                myHash = result.hash
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func accountToken() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        Task {
            do {
                let result = try await Unique.Token.accountTokens(parameters: .init(at: nil, address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", collectionId: 205))
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func tokensOwner() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        Task {
            do {
                let result = try await Unique.Token.owner(parameters: .init(at: nil, collectionId: 205, tokenId: 1))
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func approve() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        Task {
            do {
                let result = try await Unique.Token.approve.submitWatch(parameters: buildParameters, body: .init(address: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", spender: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd", collectionId: 205, tokenId: 1, isApprove: true), account: account1, userAuthenticationType: .biometric)
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    func allow() {
        let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
        Task {
            do {
                let result = try await Unique.Token.allowance(parameters: .init(at: nil, collectionId: 205, tokenId: 1, from: "5HEK4aJcrzw1M7cqvXDzGBUVcUEAsCACJ6Jyn4P56R3DyJEo", to: "5F1q9WbbuRZNnToTaYCv6JH8tTbZRKeUs1KnXCmFFqKXFTMd"))
                print("result = \(result)")

            } catch (let error) {
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

