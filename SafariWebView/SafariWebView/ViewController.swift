//
//  ViewController.swift
//  SafariWebView
//
//  Created by trainee on 21/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func btnSafariTapped(_ sender: Any) {
        if let url = URL(string: "https://www.Google.com") {
//            UIApplication.shared.open(url)
            
            let openSafari = SFSafariViewController(url: url)
            present(openSafari, animated: true)
            
    }

    }

}
