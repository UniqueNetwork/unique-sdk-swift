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
    
    var completion: ((Result<Bool, NSError>) -> Void)?
        
    func auth(confirmationType: UNQUserAuthenticationType, completion: @escaping (Result<Bool, NSError>) -> Void) {
        self.completion = completion
        switch confirmationType {
        case .biometric:
            confirmWithBiometric()
        case .password(let code):
            confirmWithPassCode(code: code)
        }
    }
    
    private func confirmWithBiometric() {
        guard let completion = completion else { return }
        
        let context = LAContext()
        var authError: NSError?
        let reason = " "

        let permission = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError)
        guard permission else { completion(.failure(authError!)); return }
        
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
            
            if success {
                completion(.success(true))
            } else {
                completion(.failure(error! as NSError))
            }
            
        }
    }
    
    private func confirmWithPassCode(code: String) {
        guard let completion = completion else { return }
        
        let storedCode = KeychainService().loadFromKeychain(key: Global.VerificationKey.key)
        if storedCode == code {
            completion(.success(true))
        } else {
            completion(.failure(NSError()))
        }

    }
}
