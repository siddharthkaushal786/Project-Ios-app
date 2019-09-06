//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire

var loginView: UIView!
class ViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropShadow()
        buttonShadow()
        
    }
    @IBAction func btnLogin(_ sender: Any) {
        
       let parameters: Parameters = [ "username" : txtUsername.text!, "password" : txtPassword.text! ]
        let url1 = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
        //let urlRequest = URLRequest(url: url1)
        Alamofire.request(url1, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString {response in
            
            switch response.result {
            case .success:
                print(response)
                break
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func dropShadow(scale: Bool = true) {
        // set the shadow of the view's layer
        loginView.layer.masksToBounds = false
        loginView.layer.cornerRadius = 10
        loginView.backgroundColor = UIColor(red: 172/255, green: 45/255, blue: 97/255, alpha: 1.0)
        loginView.layer.shadowColor = UIColor.green.cgColor
        loginView.layer.shadowOpacity = 0.6
        loginView.layer.shadowOffset = .zero
        loginView.layer.shadowRadius = 15.0
        loginView.layer.shadowPath = UIBezierPath(rect: loginView.bounds).cgPath
        loginView.layer.shouldRasterize = true
        loginView.layer.rasterizationScale = scale ? UIScreen.main.scale : 1

    }
    
    func buttonShadow(){
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.cornerRadius = 10
        //btnLogin.backgroundColor = UIColor.blue
        btnLogin.layer.shadowColor = UIColor.red.cgColor
        btnLogin.layer.shadowOffset = CGSize(width: 5, height: 5)
        btnLogin.layer.shadowRadius = 5
        btnLogin.layer.shadowOpacity = 1.0
        
    }
    

}

