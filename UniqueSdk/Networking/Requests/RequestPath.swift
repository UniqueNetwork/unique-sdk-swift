//
//  RequestPath.swift
//  UniqueSDK
//
//  Created by Мах Ol on 11.11.2022.
//

import Foundation

protocol IPath {
    var rawValue: String { get }
}

enum RequestPath {
    
    enum Balance: String, IPath {
        case transfer = "/balance/transfer"
    }
    
    
    enum Collection: String, IPath {
        case collections = "/collections"
        case stats = "/collections/stats"
        case limits = "/collections/limits"
        case setLimits = "/collections/set-limits"
    }
}

