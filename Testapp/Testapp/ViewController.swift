//
//  ViewController.swift
//  Testapp
//
//  Created by trainee on 09/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
   @IBOutlet weak var txtContact: UITextField!
    
@IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtState: UITextField!
    
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var confirmpwd: UITextField!
    
     //name.resignFirstResponder()
        //email.resignFirstResponder()
        //pwd.resignFirstResponder()
        //confirmpwd.resignFirstResponder()

        /*if pwd.text != confirmpwd.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: email.text!, password: pwd.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "home", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }*/
        
        
       /* let alertController = UIAlertController(title: "iOScreator", message:
            "Hello, world!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
       
       
        
        
        
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
      // name.delegate = self
    self.hideKeyboardWhenTappedAround()
        

        
    }
    @IBAction func btnSubmit(_ sender: Any) {
        
        if (name.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator", message:
         "Hello, world!", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         
         self.present(alertController, animated: true, completion: nil)
         }else if (txtContact.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator" , message: "Contact Field is Empty", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         self.present(alertController, animated: true, completion: nil)
         }else if (txtAddress.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator" , message: "Address Field is Empty", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         self.present(alertController, animated: true, completion: nil)
         }else if (txtZip.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator" , message: "Zip Field is Empty", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         self.present(alertController, animated: true, completion: nil)
         }else if (txtCity.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator" , message: "City Field is Empty", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         self.present(alertController, animated: true, completion: nil)
         }else if (txtState.text?.isEmpty)!{
         let alertController = UIAlertController(title: "iOScreator" , message: "State Field is Empty", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
         self.present(alertController, animated: true, completion: nil)
        }else if (pwd.text?.isEmpty)!{
            let alertController = UIAlertController(title: "Oops!" , message: "Please enter your password.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }

    }
   /* func validate(_ textField: UITextField) -> (Bool, String?) {
        guard let text = textField.text else {
            return (false, nil)
        }
        
        if textField == name {
            return (text.count >= 6, "Your password is too short.")
        }
        
        return (text.count > 0, "This field cannot be empty.")
    }*/
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


