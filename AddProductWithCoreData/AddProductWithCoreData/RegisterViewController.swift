//
//  RegisterViewController.swift
//  AddProductWithCoreData
//
//  Created by trainee on 17/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    @IBOutlet weak var txtFldUsername: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldCnmPassword: UITextField!

   let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnRegisterClick(_ sender: Any) {
        
        if txtFldUsername.text == "" || txtFldEmail.text == "" || txtFldPassword.text == "" || txtFldCnmPassword.text == ""
        {
            displayMeassage(userMessage: "Its Mandatory to enter all the fields")
            
            return
            
            
        }
            
        else if (txtFldPassword.text != txtFldCnmPassword.text)
        {
            displayMeassage(userMessage: "Please make sure that password match")
            
            return
            
        }
            
        else
        {
            let productUser = NSEntityDescription.insertNewObject(forEntityName: "ProductUser", into: context)
            
            productUser.setValue(txtFldUsername.text, forKey: "username")
            productUser.setValue(txtFldEmail.text, forKey: "email")
            productUser.setValue(txtFldPassword.text, forKey: "password")
            productUser.setValue(txtFldCnmPassword.text, forKey: "confirmPassword")
            txtFldUsername.text = ""
            txtFldEmail.text = ""
            txtFldPassword.text = ""
            txtFldCnmPassword.text = ""
            
            do
            {
                try context.save()
                print("Registered  Sucessfully")
            }
            catch
            {
                let Fetcherror = error as NSError
                print("error", Fetcherror.localizedDescription)
            }
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func displayMeassage(userMessage : String){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}



