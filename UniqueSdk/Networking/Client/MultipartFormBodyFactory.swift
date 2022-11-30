//
//  MultipartFormBodyFactory.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        let data = string.data(using: .utf8, allowLossyConversion: false)
        append(data!)
    }
}

struct MultipartFormBodyFactory {
    
    var boundary: String = "WebKitFormBoundary7MA4YWxkTrZu0gW"
    private var boundaryPrefix: String {
        return "\r\n--\(boundary)\r\n"
    }
    private var finalBoundary: String {
        return "--\(boundary)--\r\n"
    }
    
    private var crlf = "\r\n\r\n"
    private var mcrlf = "\r\n"
    
    func create(
        parameters: [String: String]? = nil,
        jsonString: String? = nil,
        with files: [UNQFormData]? = nil
    ) -> Data {
        
        var body = Data()
        
        if let parameters = parameters {
            for (key, value) in parameters {
                body.append(boundaryPrefix)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(crlf)")
                body.append("\(value)")
            }
        }
        
        if let json = jsonString {
            let key = "data"
            body.append(boundaryPrefix)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\(crlf)")
            body.append("\(json)\(mcrlf)")
        }
        
        if let files = files {
            for file in files {
                appendFile(file, name: file.fileName, to: &body)
            }
        }
        
        body.append(finalBoundary)
        
        return body as Data
    }
    
    private func appendFile(_ file: UNQFormData, name: String, to body: inout Data) {
        body.append(boundaryPrefix)
        body.append("Content-Disposition: form-data; name=\"\(file.name)\"; filename=\"\(file.fileName)\"\(mcrlf)")
        body.append("Content-Type: \(file.mimeType)\(crlf)")
        body.append(file.data)
        body.append(mcrlf)
    }
}

