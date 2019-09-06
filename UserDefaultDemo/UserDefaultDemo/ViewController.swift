//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
   
    @IBOutlet weak var lblShow: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
    }
    @IBAction func btnSave(_ sender: Any) {
        UserDefaults.standard.set(txtUserName.text, forKey: "name")
        UserDefaults.standard.set(txtPassword.text, forKey: "password")
        
        txtUserName.text = ""
        txtPassword.text = ""
        
    }
    
    func getData()
    {
        let name = UserDefaults.standard.string(forKey: "name")
lblShow.text = name
        
      let password = UserDefaults.standard.string(forKey: "password")
        lblShow.text = password
    }

}

