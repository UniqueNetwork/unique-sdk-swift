//
//  IpfsUploadRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

struct IpfsUploadRequest: IRequest {
    
    // MARK: - Properties

    private let requestBody: Data
    private let boundary: String
    
    // MARK: - Initialization
    
    public init(file: UNQFormData) {
        var newFile = file
        newFile.name = "file"
        let factory = MultipartFormBodyFactory()
        self.requestBody = factory.create(parameters: nil, jsonString: nil, with: [newFile])
        self.boundary = factory.boundary
    }
    
    // MARK: - IRequest
    
    var headers: [String : String]? {
        return ["multipart/form-data; boundary=\(boundary)": "Content-Type"]
    }

    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return "/ipfs/upload-file"
    }
    
    var body: Data? {
        return requestBody
    }
    
}
