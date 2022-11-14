//
//  ColletionIO.swift
//  UniqueSDK
//
//  Created by Мах Ol on 10.11.2022.
//

import Foundation

public protocol IColletionIO {
    var creation: Mutation<UNQCreateColletionBody> { get }
}

public class ColletionIO: IColletionIO {
        
  public var creation = Mutation<UNQCreateColletionBody>(path: RequestPath.Collection.create.rawValue)
    
}
