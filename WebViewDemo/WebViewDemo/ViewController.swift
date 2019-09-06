//
//  ViewController.swift
//  WebViewDemo
//
//  Created by trainee on 20/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var actIndView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let url  = URL(string: "http://www.google.com")
        let request = URLRequest(url: url!)

        webView.load(request)
        
      webView.addSubview(actIndView)
      actIndView.stopAnimating()
        
        webView.navigationDelegate = self
        actIndView.hidesWhenStopped = true
    }

    @IBAction func btnBack(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    @IBAction func btnForward(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    @IBAction func btnRefresh(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func btnStop(_ sender: Any) {
        webView.stopLoading()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        actIndView.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        actIndView.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        actIndView.stopAnimating()
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        
        
        let url  = URL(string: "http://\(searchBar.text!)")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
    }
}

