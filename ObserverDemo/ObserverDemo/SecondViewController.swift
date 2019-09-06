//
//  SecondViewController.swift
//  ObserverDemo
//
//  Created by trainee on 19/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func btnTwitter(_ sender: Any) {
    NotificationCenter.default.post(name: .twitter, object: nil)
        
     storyboard?.instantiateViewController(withIdentifier: "ViewController")
         self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func btnFacebook(_ sender: Any) {
        NotificationCenter.default.post(name: .facebook, object: nil)
     storyboard?.instantiateViewController(withIdentifier: "ViewController") 
   self.navigationController?.popToRootViewController(animated: true)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
  
}
