//
//  WebViewController.swift
//  Locationapp
//
//  Created by trainee on 25/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webViewScreen: WKWebView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    var myActivityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.center = self.view.center
        myActivityIndicator.style = .gray
        webViewScreen.addSubview(myActivityIndicator)
        
         //Adding observer for show loading indicator
        webViewScreen.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        func searchTextOnGoogle(text: String){
            let textComponent = text.components(separatedBy: " ")
            let searchString = textComponent.joined(separator: "+")
            let url = URL(string: "https://www.googleapis.com/customsearch/v1?key=AIzaSyADvusy5scNHUVhtiRUGN2bZZZxSagNSTw" + searchString)
            let urlRequest = URLRequest(url: url!)
            webViewScreen.load(urlRequest)
        }
        if let urlString = txtSearch.text{
            if urlString.starts(with: "http://") || urlString.starts(with: "https://"){
                webViewScreen.loadUrl(string: urlString)
            }else if urlString.contains("www"){
                webViewScreen.loadUrl(string: "http://\(urlString)")
            }else{
                searchTextOnGoogle(text: urlString)
            }
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        webViewScreen.goForward()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        webViewScreen.goBack()
    }
    
    //MARK: - ActivityIndicator StartAnimate And StopAnimate
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading"{
            if webViewScreen.isLoading{
                
                myActivityIndicator.startAnimating()
                myActivityIndicator.isHidden = false
                btnBack.isEnabled = webViewScreen.canGoBack
                btnNext.isEnabled = webViewScreen.canGoForward
            }else{
                myActivityIndicator.stopAnimating()
            }
        }
    }
  
}
//MARK: - Load Url In Webview
extension WKWebView {
    func loadUrl(string: String) {
        if let url = URL(string: string) {
            load(URLRequest(url: url))
        }
    }
}
