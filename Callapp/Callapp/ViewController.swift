//
//  ViewController.swift
//  Callapp
//
//  Created by trainee on 25/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CallKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNumber: UITextField!
    
override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    @IBAction func btnCall(_ sender: Any) {
        
        let url:NSURL = NSURL(string: "tel://123456789")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    }


