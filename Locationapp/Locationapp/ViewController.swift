//
//  ViewController.swift
//  Locationapp
//
//  Created by trainee on 25/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate{
    @IBOutlet weak var webViewScreen: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
       let url = URL(string: "https://ioscreator.com")!
        webViewScreen.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

