//
//  UIApplecation+Extension.swift
//  UniqueSDK
//
//  Created by Мах Ol on 07.11.2022.
//

import Foundation
import UIKit

extension UIApplication {
    
    class func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        } else {
            return nil
        }
    }
}

