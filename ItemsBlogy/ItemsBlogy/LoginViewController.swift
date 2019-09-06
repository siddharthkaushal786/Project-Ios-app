//
//  LoginViewController.swift
//  ItemsBlogy
//
//  Created by trainee on 16/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtConfirmpassword: UITextField!
    @IBOutlet weak var cnstHeightTxtFldName: NSLayoutConstraint!
    
    @IBOutlet weak var viewUser: UIView!
    @IBOutlet weak var viewtxtUsername: UIView!
    @IBOutlet weak var viewtxtPassword: UIView!
    @IBOutlet weak var viewtxtEmail: UIView!
    @IBOutlet weak var viewtxtMobile: UIView!
    @IBOutlet weak var imgUncheckedbox: UIImageView!
    @IBOutlet weak var lblRememberme: UILabel!
    @IBOutlet weak var btnForgotpassword: UIButton!
    @IBAction func btnForgotpassword(_ sender: Any) {
    }
    
    
   let objSignInVC = SignInViewController()
    let signOutVC = SignUpViewController()
    
   
    @IBAction func btnSignIN(_ sender: Any) {
    
        
       // UIButton.layer.cor
       // viewUser.isHidden = false
        viewUser.isHidden = false
        txtUsername.isHidden = false
        self.viewtxtUsername.isHidden = false
        txtPassword.isHidden = false
        self.viewtxtPassword.isHidden = false
        
        cnstHeightTxtFldName.constant = 50
        txtEmail.isHidden = true
        self.viewtxtEmail.isHidden = true
        txtMobile.isHidden = true
        self.viewtxtMobile.isHidden = true
        txtConfirmpassword.isHidden = true
       
        //cnstHeightTxtFldName.constant = 50
        
        self.imgUncheckedbox.isHidden = false
        self.lblRememberme.isHidden = false
        self.btnForgotpassword.isHidden = false
    }
    @IBAction func btnSignUp(_ sender: Any) {
       
        viewUser.isHidden = false
        self.txtUsername.isHidden = true
        self.viewtxtUsername.isHidden = true
        self.txtPassword.isHidden = false
        self.viewtxtPassword.isHidden = false
        self.txtEmail.isHidden = false
        self.viewtxtEmail.isHidden = false
        self.txtMobile.isHidden = false
        self.viewtxtMobile.isHidden = false
        self.txtConfirmpassword.isHidden = false
        self.imgUncheckedbox.isHidden = true
        self.lblRememberme.isHidden = true
        self.btnForgotpassword.isHidden = true
        cnstHeightTxtFldName.constant = 0
        
    }
   
    override func viewDidLoad() {
      self.viewUser.isHidden = true
        

        super.viewDidLoad()

       
    }

}
