//
//  IpfsIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 29.11.2022.
//

import Foundation

public protocol IIpfsIO {
    func uploadFile(file: UNQFormData) async throws -> UNQIpfsUploadResponse
    func uploadFiles(files: [UNQFormData]) async throws -> UNQIpfsUploadResponse
    func addFiles(files: [UNQFormData], cid: String) async throws -> UNQIpfsUploadResponse
}

public class IpfsIO: IIpfsIO {
    
    let networkClient: INetworkClient = NetworkClient()

    public func uploadFile(file: UNQFormData) async throws -> UNQIpfsUploadResponse {
        let request = IpfsUploadRequest(file: file)
        return try await networkClient.send(request)
    }
    
    public func uploadFiles(files: [UNQFormData]) async throws -> UNQIpfsUploadResponse {
        let request = IpfsUploadMultipleRequest(files: files)
        return try await networkClient.send(request)
    }
    
    public func addFiles(files: [UNQFormData], cid: String) async throws -> UNQIpfsUploadResponse {
        let request = IpfsAddMultipleRequest(files: files, cid: cid)
        return try await networkClient.send(request)
    }
}

