//
//  URLSessionProvider.swift
//  UniqueSDK
//
//  Created by Мах Ol on 19.10.2022.
//

import Foundation

internal class URLSessionProvider: NSObject {
    
    private override init() {}
    
    static var urlSession: URLSession = {
        let session = URLSession(
            configuration: .default,
            delegate: URLSessionProvider(),
            delegateQueue: nil
        )
        return session
    }()
}

extension URLSessionProvider: URLSessionDelegate {
    
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        // Trust the certificate even if not valid
        // swiftlint:disable:next force_unwrapping
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        
        completionHandler(.useCredential, urlCredential)
    }
}
