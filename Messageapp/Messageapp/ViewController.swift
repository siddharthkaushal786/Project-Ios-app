//
//  ViewController.swift
//  Messageapp
//
//  Created by trainee on 22/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import MessageUI
class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var txtviewBody: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnSend(_ sender: Any) {
        
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["3142026521"]
        composeVC.body = "I love Swift!"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
    
    
    @IBAction func btnSendEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            
            let message:String  = txtviewBody.text
            
            let composePicker = MFMailComposeViewController()
            
            composePicker.mailComposeDelegate = self
            
            composePicker.delegate = self as? UINavigationControllerDelegate
            
            composePicker.setToRecipients(["support@loginworks.com"])
            
            composePicker.setSubject("Testing Email")
            
            composePicker.setMessageBody(message, isHTML: false)
            
            self.present(composePicker, animated: true, completion: nil)
            
        }
            
        else {
            
            self .showerrorMessage()
            print("hello")
            
        }
       
    }
  // Message Compose
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    //Mail Compose
    
    func mailComposeController(_ controller:MFMailComposeViewController, didFinishWith didFinishWithResult:MFMailComposeResult, error:Error?) {
        

            dismiss(animated: true, completion: nil)
        
    }
    
    
    func showerrorMessage() {
        
        let alertMessage = UIAlertController(title: "could not sent email", message: "check if your device have email support!", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title:"Okay", style: UIAlertAction.Style.default, handler: nil)
        
        alertMessage.addAction(action)
        
        self.present(alertMessage, animated: true, completion: nil)
        
    }
   
    // UITextFieldDelegate
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // UITextViewDelegate
  
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        txtviewBody.text = textView.text
        
        if text == "\n" {
            textView.resignFirstResponder()
            
            return false
        }
        
        return true
    }
    
   
}

