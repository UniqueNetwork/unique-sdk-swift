//
//  UserAuthenticator.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import UIKit
import LocalAuthentication

class UserAuthenticator {
    
    func auth(userAuthenticationType: UNQUserAuthenticationType) async throws -> Bool {
        switch userAuthenticationType {
        case .biometric:
            return try await confirmWithBiometric()
        case .password(let code):
            return try await confirmWithPassCode(code: code)
        }
    }
    
    private func confirmWithBiometric() async throws -> Bool {
        
        let context = LAContext()
        var authError: NSError?
        let reason = " "
        
        let permission = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError)
        guard permission else { throw authError! }
        
        return try await context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason)
    }
    
    private func confirmWithPassCode(code: String) async throws -> Bool {
        
        let storedCode = KeychainService().loadFromKeychain(key: Global.VerificationKey.key)
        if storedCode == code {
            return true
        } else {
            throw UNQError.passcodeNotFound
        }
        
    }
}
