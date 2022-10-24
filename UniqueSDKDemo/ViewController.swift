//
//  ViewController.swift
//  UniqueSDKDemo
//
//  Created by Мах Ol on 19.10.2022.
//

import UIKit
import UniqueSDK


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Unique.balance.getBalance(address: "5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty") { result in
            switch result {
            case .success(let balance):
                balance.availableBalance
                print("balance = \(balance)")
            case .failure(let error):
                print("error = \(error)")
            }
        }
    }


}

