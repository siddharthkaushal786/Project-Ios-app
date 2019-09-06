//
//  ForgotPasswordViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnResetPwd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        txtFieldShadow()
        buttonShadow()
    }
    
    @IBAction func btnForgotPassword(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
//        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //Set Textfield corner and shadow
    func txtFieldShadow(scale: Bool = true) {
        txtEmail.layer.masksToBounds = false
        txtEmail.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtEmail.layer.shadowColor = UIColor.blue.cgColor
        txtEmail.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtEmail.layer.shadowRadius = 15.0
        txtEmail.layer.shouldRasterize = true
        txtEmail.layer.shadowOpacity = 0.6
        txtEmail.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    
    //Set Button corner and shadow
    func buttonShadow(scale: Bool = true){
        btnResetPwd.layer.masksToBounds = false
        btnResetPwd.layer.cornerRadius = 10
        btnResetPwd.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnResetPwd.layer.shadowColor = UIColor.blue.cgColor
        btnResetPwd.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnResetPwd.layer.shadowRadius = 15.0
        btnResetPwd.layer.shouldRasterize = true
        btnResetPwd.layer.shadowOpacity = 0.6
        btnResetPwd.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
}
