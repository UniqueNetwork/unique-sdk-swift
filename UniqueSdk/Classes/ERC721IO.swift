//
//  ERC721IO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 28.11.2022.
//

import Foundation

public protocol IERC721IO {
    var createCollection: Mutation<UNQCreateERC721CollectionBody> { get }
    var createToken: Mutation<UNQCreateERC721TokenBody> { get }
}

public class ERC721IO: IERC721IO {
    
    public var createCollection = Mutation<UNQCreateERC721CollectionBody>(path: RequestPath.ERC721.collection.rawValue, method: .post)
    
    public var createToken = Mutation<UNQCreateERC721TokenBody>(path: RequestPath.ERC721.token.rawValue, method: .post)
}
