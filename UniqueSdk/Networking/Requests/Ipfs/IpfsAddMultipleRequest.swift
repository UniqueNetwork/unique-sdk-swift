//
//  IpfsAddMultipleRequest.swift
//  UniqueSDK
//
//  Created by Мах Ol on 30.11.2022.
//

import Foundation

struct IpfsAddMultipleRequest: IRequest {
    
    // MARK: - Properties

    private let requestBody: Data
    private let boundary: String
    
    // MARK: - Initialization
    
    public init(files: [UNQFormData], cid: String) {
        let newFiles: [UNQFormData] = files.map { .init(name: "files", fileName: $0.fileName, mimeType: $0.mimeType, data: $0.data) }
        let factory = MultipartFormBodyFactory()
        self.requestBody = factory.create(parameters: ["cid": cid], jsonString: nil, with: newFiles)
        self.boundary = factory.boundary
    }
    
    // MARK: - IRequest
    
    var headers: [String : String]? {
        return ["multipart/form-data; boundary=\(boundary)": "Content-Type"]
    }

    var method: HTTPMethod {
        return .patch
    }
    
    var path: String {
        return "/ipfs/add-files"
    }
    
    var body: Data? {
        return requestBody
    }
    
}
