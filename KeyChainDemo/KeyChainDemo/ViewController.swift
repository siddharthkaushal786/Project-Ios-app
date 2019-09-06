//
//  ViewController.swift
//  KeyChainDemo
//
//  Created by trainee on 19/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {
    @IBOutlet weak var txtPassword: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnSavePassword(_ sender: Any) {

        if let password = txtPassword.text {
            let saveSuccessful: Bool = KeychainWrapper.standard.set(password, forKey: "userPassword")
            print("Save was successful: \(saveSuccessful)")
            self.view.endEditing(true)
        }
    }
    
    @IBAction func btnRetrieve(_ sender: Any) {
        let retrievedPassword: String? = KeychainWrapper.standard.string(forKey: "userPassword")
        print("Retrieved passwork is: \(retrievedPassword!)")
    }
    }


