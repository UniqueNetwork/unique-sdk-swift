//
//  Use.swift
//  UniqueSDK
//
//  Created by Мах Ol on 24.10.2022.
//

import Foundation

public enum UseType: String, Codable {
    case build = "Build"
    case buildBatch = "BuildBatch"
    case sign = "Sign"
    case submit = "Submit"
    case submitWatch = "SubmitWatch"
    case result = "Result"
}
