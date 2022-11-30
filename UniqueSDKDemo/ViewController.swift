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
        addFiles()
    }
    
    func uploadSingleFile() {
        Task {
            do {
                let imageFileURL = Bundle.main.url(forResource: "myTestPngImage", withExtension: "png")!
                let fileContents = (try? Data(contentsOf: imageFileURL))!
                let image = UIImage(data: fileContents)
                let pngData = image?.pngData()
                let formData = UNQFormData(fileName: "myTestPngImage.png", mimeType: "image/png", data: pngData!)
                let result = try await Unique.Ipfs.uploadFile(file: formData)
                print("result = \(result)")

            } catch(let error) {
                print(error)
            }
        }
    }
    
    func addFiles() {
     Task {
         do {
             let imageFileURL = Bundle.main.url(forResource: "sampleImage", withExtension: "jpg")!
             let imageData = (try? Data(contentsOf: imageFileURL))!
             let image = UIImage(data: imageData)
             let jpegData = image?.jpegData(compressionQuality: 1)
             
                let pdfFileURL = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")
                let pdfData = try! Data(contentsOf: pdfFileURL!)
             
//             let imageFileURL2 = Bundle.main.url(forResource: "butPNG", withExtension: "png")!
//             let imageData2 = (try? Data(contentsOf: imageFileURL2))!
//             let image2 = UIImage(data: imageData2)
//             let pngData2 = image2?.pngData()

             
             
             let formData1 = UNQFormData(fileName: "sampleImage.jpg", mimeType: "image/jpg", data: jpegData!)
             let formData2 = UNQFormData(fileName: "sample.pdf", mimeType: "application/pdf", data: pdfData)
             let result = try await Unique.Ipfs.addFiles(files: [formData1, formData2], cid: "QmfYc6PZaY5t2qwWRVg4eA1ucYb6revSQ4ADJxhz3heZG7")
             print("result = \(result)")

         } catch(let error) {
             print(error)
         }
     }
    }
    
    func uploadMultiFiles() {
        Task {
            do {
                let imageFileURL = Bundle.main.url(forResource: "myTestPngImage", withExtension: "png")!
                let imageData = (try? Data(contentsOf: imageFileURL))!
                let image = UIImage(data: imageData)
                let pngData = image?.pngData()
                
//                let pdfFileURL = Bundle.main.url(forResource: "samplePDF", withExtension: "pdf")
//                let pdfData = try! Data(contentsOf: pdfFileURL!)
                
                let imageFileURL2 = Bundle.main.url(forResource: "butPNG", withExtension: "png")!
                let imageData2 = (try? Data(contentsOf: imageFileURL2))!
                let image2 = UIImage(data: imageData2)
                let pngData2 = image2?.pngData()

                
                
                let formData1 = UNQFormData(fileName: "myTestPngImage.png", mimeType: "image/png", data: pngData!)
                let formData2 = UNQFormData(fileName: "butPNG.pdf", mimeType: "image/png", data: pngData2!)
                let result = try await Unique.Ipfs.uploadFiles(files: [formData1, formData2])
                print("result = \(result)")

            } catch(let error) {
                print(error)
            }
        }
    }
    
    func getim() {
        let imageFileURL = Bundle.main.url(forResource: "myTestPngImage", withExtension: "png")!
        let imageData = try! Data(contentsOf: imageFileURL)
        let image: UIImage = UIImage(data: imageData)!
        self.uploadImage(paramName: "file", fileName: "myTestPngImage.jpg", image: image)
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

    }
    


    func uploadImage(paramName: String, fileName: String, image: UIImage) {
        let url = URL(string: "https://rest.opal.uniquenetwork.dev/v1/ipfs/upload-file")

        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString

        let session = URLSession.shared

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()

        // Add the image data to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append(image.pngData()!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            print("responseData = \(responseData?.prettyPrintedJSONString)")
            print("response = \(response)")
            print("error = \(error)")
            
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]

            let attributedString = try! NSAttributedString(data: responseData!, options: options, documentAttributes: nil)

            // The Weeknd ‘King Of The Fall’
            let decodedString = attributedString.string
            print("decodingStr = \(decodedString)")
            
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
            
//            let result = try! JSONDecoder().decode(UNQIpfsUploadResponse.self, from: responseData!)
//            print(result)
        }).resume()
    }
    
    
}

