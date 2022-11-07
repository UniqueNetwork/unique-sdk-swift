//
//  AccountVerifier.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import UIKit
import LocalAuthentication

class AccountVerifier {
    
    private let account: UNQAccount
    
    init(account: UNQAccount) {
        self.account = account
    }
    
    func verify( completion: @escaping (Result<String, NSError>) -> Void) {
        let context = LAContext()
        var error: NSError?
        var mnemonic: String?
        
        let permission = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        print("permission = \(permission)")
        if permission {
            let reason = "Sign transaction"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    
                
                if success {
                    print("successed")
                    guard let mnemonic = self.getMnemonic() else {print("не найден мнемоник");return}
                    completion(.success(mnemonic))
                } else {
                    let alert = UIAlertController(title: "Ошибка", message: "Неузнаю вас", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Подтвердить по паролю", style: .default, handler: { _ in
                        alert.dismiss(animated: true)
                        let newAlert = UIAlertController(title: "Подтверждение транзакции", message: "Введите пароль", preferredStyle: .alert)
                        newAlert.addTextField { (textField : UITextField!) -> Void in
                            textField.placeholder = "Enter Second Name"
                        }
                        let saveAction = UIAlertAction(title: "Подтвердить", style: .default, handler: { alert -> Void in
                                let firstTextField = newAlert.textFields![0] as UITextField
                            if (firstTextField.text ?? "") == KeychainService().loadFromKeychain(key: Global.VerificationKey.key) {
                                guard let mnemonic = self.getMnemonic() else {return}
                                completion(.success(mnemonic))
                            } else {
                                print("Неверный код")
                                completion(.failure(NSError()))
                            }
                                
                            })
                        newAlert.addAction(saveAction)
                        UIApplication.topViewController()?.present(newAlert, animated: true)

                        
                    }))
                    
                    UIApplication.topViewController()?.present(alert, animated: true)
                    completion(.failure(error as! NSError))
                }
                }
            }
            
        } else {
            let alert = UIAlertController(title: "Нет разрешения для использования биометрии", message: "Пожалуйста, разрешите использование биометрии в настройках приложения", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            UIApplication.topViewController()?.present(alert, animated: true)
            completion(.failure(error ?? NSError()))
        }
    }
    
    private func getMnemonic() -> String? {
        print("getMenmonic")
        let service = KeychainService()
        let mnemonic = service.loadFromKeychain(key: account.address)
        print("mnemonic = \(mnemonic)")
        return mnemonic
    }
    
}
