//
//  ViewController.swift
//  AddProductWithCoreData
//
//  Created by trainee on 17/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController {
    @IBOutlet weak var vwLogin: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    var result = NSArray()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        
        if txtFldUsername.text == "" && txtFldPassword.text == ""
        {
            displayMessage(message: "Username and Login fields are mandatory for login")
            return
            
        }
        else
            
        {
            
            self.CheckForUserNameAndPasswordMatch(username : txtFldUsername.text! as String, password : txtFldPassword.text! as String)
            
            
        }
    }
    
    @IBAction func btnSignUpClick(_ sender: Any) {
        
        let registerVc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        self.navigationController?.pushViewController(registerVc, animated: true)
    }
    
    func CheckForUserNameAndPasswordMatch( username: String, password : String)
    {
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductUser")
        
        let predicate = NSPredicate(format: "username = %@", username)
        
        fetchrequest.predicate = predicate
        do
        {
            result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.firstObject as! ProductUser
                
                if objectentity.username == username && objectentity.password == password
                {
                    let productVc = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
                    self.navigationController?.pushViewController(productVc, animated: true)
                    
                    displayMessage(message: "Wellcome Home")
                    
                    print("Login Succesfully")
                }
                else
                {
                    displayMessage(message: "Wrong username or password !!!")
                    
                    print("Wrong username or password !!!")
                }
            }
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        
    }
    
    func displayMessage(message : String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        // print("Login Succesfully")
    }


}

extension LoginViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        dropShadow()
    }
    func dropShadow(scale: Bool = true) {
        
        vwLogin.layer.masksToBounds = false
        vwLogin.layer.cornerRadius = 15
        vwLogin.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        vwLogin.layer.shadowColor = UIColor.green.cgColor
        vwLogin.layer.shadowOpacity = 0.6
        vwLogin.layer.shadowOffset = .zero
        vwLogin.layer.shadowRadius = 12.0
        vwLogin.layer.shadowPath = UIBezierPath(rect: vwLogin.bounds).cgPath
        vwLogin.layer.shouldRasterize = true
        vwLogin.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.cornerRadius = 10
        btnLogin.backgroundColor = UIColor(red: 198/255, green: 94/255, blue: 147/255, alpha: 1.0)
        btnLogin.layer.shadowColor = UIColor.blue.cgColor
        btnLogin.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnLogin.layer.shadowRadius = 15.0
        btnLogin.layer.shouldRasterize = true
        btnLogin.layer.shadowOpacity = 0.6
        btnLogin.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
        
    }
}
