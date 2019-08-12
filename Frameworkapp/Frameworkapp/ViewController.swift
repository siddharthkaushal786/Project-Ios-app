//
//  ViewController.swift
//  Frameworkapp
//
//  Created by trainee on 22/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import ContactsUI


class ViewController: UIViewController, CNContactPickerDelegate {
  
    @IBOutlet weak var tableviewCOntact: UITableView!
    @IBOutlet weak var lblContact: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAddContact(_ sender: Any) {
        
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
    }
   
    //MARK:- CNContactPickerDelegate Method
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                self.lblContact.text = " Contact No. \((number.value).stringValue )"
                print("number is = \(phoneNumber)")
                
            }
        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
        print("Cancel Contact Picker")
    }
    
    
    }
    

