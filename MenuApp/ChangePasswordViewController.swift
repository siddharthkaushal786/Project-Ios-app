//
//  ChangePasswordViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var viewChangePassword: UIView!
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtVerifyPassword: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnChangepwd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dropShadow()
        txtFieldShadow()
        buttonShadow()
        }
   
    @IBAction func btnChangePassword(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
//        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //Set ViewChangePassword corner and shadow
    func dropShadow(scale: Bool = true) {
        // set the shadow of the view's layer
        viewChangePassword.layer.masksToBounds = false
        viewChangePassword.layer.cornerRadius = 10
        viewChangePassword.backgroundColor = UIColor(red: 202/255, green: 202/255, blue: 149/255, alpha: 1.0)
        viewChangePassword.layer.shadowColor = UIColor.green.cgColor
        viewChangePassword.layer.shadowOpacity = 0.6
        viewChangePassword.layer.shadowOffset = .zero
        viewChangePassword.layer.shadowRadius = 15.0
        viewChangePassword.layer.shadowPath = UIBezierPath(rect: viewChangePassword.bounds).cgPath
        viewChangePassword.layer.shouldRasterize = true
        viewChangePassword.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    
    //Set Textfield corner and shadow
    func txtFieldShadow(scale: Bool = true) {
        txtOldPassword.layer.masksToBounds = false
        txtOldPassword.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtOldPassword.layer.shadowColor = UIColor.blue.cgColor
        txtOldPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtOldPassword.layer.shadowRadius = 15.0
        txtOldPassword.layer.shouldRasterize = true
        txtOldPassword.layer.shadowOpacity = 0.6
        txtOldPassword.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        txtNewPassword.layer.masksToBounds = false
        txtNewPassword.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtNewPassword.layer.shadowColor = UIColor.blue.cgColor
        txtNewPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtNewPassword.layer.shadowRadius = 15.0
        txtNewPassword.layer.shouldRasterize = true
        txtNewPassword.layer.shadowOpacity = 0.6
        txtNewPassword.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        txtVerifyPassword.layer.masksToBounds = false
        txtVerifyPassword.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtVerifyPassword.layer.shadowColor = UIColor.blue.cgColor
        txtVerifyPassword.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtVerifyPassword.layer.shadowRadius = 15.0
        txtVerifyPassword.layer.shouldRasterize = true
        txtVerifyPassword.layer.shadowOpacity = 0.6
        txtVerifyPassword.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    //Set Button corner and shadow
    func buttonShadow(scale: Bool = true){
        btnCancel.layer.masksToBounds = false
        btnCancel.layer.cornerRadius = 10
        btnCancel.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnCancel.layer.shadowColor = UIColor.blue.cgColor
        btnCancel.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnCancel.layer.shadowRadius = 15.0
        btnCancel.layer.shouldRasterize = true
        btnCancel.layer.shadowOpacity = 0.6
        btnCancel.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        btnChangepwd.layer.masksToBounds = false
        btnChangepwd.layer.cornerRadius = 10
        btnChangepwd.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnChangepwd.layer.shadowColor = UIColor.blue.cgColor
        btnChangepwd.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnChangepwd.layer.shadowRadius = 15.0
        btnChangepwd.layer.shouldRasterize = true
        btnChangepwd.layer.shadowOpacity = 0.6
        btnChangepwd.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
}
