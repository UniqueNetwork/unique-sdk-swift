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
    
    
    enum Collection: String, IPath {
        case create = "/collections"
    }
}


struct asd {
    let rwe: IPath = RequestPath.Collection.create
    
    func asdasd() {
        print(rwe.rawValue)
    }
}
