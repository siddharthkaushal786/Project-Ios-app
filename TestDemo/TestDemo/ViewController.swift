//
//  ViewController.swift
//  TestDemo
//
//  Created by trainee on 05/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, passDataToVC {
  
   
    

    @IBOutlet weak var txtUserField: UITextField!
    @IBOutlet weak var txtUserField1: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        objPassData = self
        print("viewdidload")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewwillapper")
    }
    
    override func viewDidAppear(_ animated: Bool) {
print("viewdidappear")
    }

    override func viewWillDisappear(_ animated: Bool) {
          print("viewwilldisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
              print("viewdiddisappear")
        
    }

    @IBAction func btnNext(_ sender: Any) {
let vc = self.storyboard?.instantiateViewController(withIdentifier: "View1Controller") as! View1Controller
      vc.txtFieldName1 = txtUserField.text
        vc.txtFieldName2 = txtUserField1.text
        self.present(vc, animated: true, completion: nil)
    }
    
    func passData(txtFieldName1: String) {
        txtUserField.text = txtFieldName1
      
    }
    
    func FatherData(txtFieldName2: String) {
        txtUserField1.text = txtFieldName2
    }
}

