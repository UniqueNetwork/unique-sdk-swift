//
//  UrlBuilder.swift
//  UniqueSDK
//
//  Created by Мах Ol on 20.10.2022.
//

import Foundation

final class UrlBuilder {
    
    private let baseUrl: URL
    private var source: String? = nil
    private var version: String? = "v1"
    private var path: String = ""
    private var parameters: [String: String] = [:]
    
    init(baseURL: URL = Configuration.shared.apiUrl()) {
        self.baseUrl = baseURL
    }
    
    func source(_ source: String?) -> UrlBuilder {
        self.source = source
        return self
    }
    
    func version(_ version: String?) -> UrlBuilder {
        self.version = version
        return self
    }
    
    func path(_ path: String) -> UrlBuilder {
        self.path = path
        return self
    }
    
    func parameter(key: String, value: String) -> UrlBuilder {
        parameters[key] = value
        return self
    }
    
    func build() -> URL {
        var url = baseUrl
        
        if let version = version {
            url = url.appendingPathComponent(version)
        }
        url = url.appendingPathComponent(path)
        // swiftlint:disable:next force_unwrapping
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        if !parameters.isEmpty {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }

        guard let buildedUrl = components.url else {
            fatalError("Can't build url")
        }
        return buildedUrl
    }
}
