//
//  View1Controller.swift
//  TestDemo
//
//  Created by trainee on 05/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
protocol passDataToVC {
    func passData(txtFieldName1: String)
     func FatherData(txtFieldName2: String)
   
}

var objPassData : passDataToVC?

class View1Controller: UIViewController {
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
    var txtFieldName1: String?
    var  txtFieldName2: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.txtField1.text = txtFieldName1
        self.txtField2.text = txtFieldName2

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //dismiss(animated: true, completion: nil)
print("view2 willapper")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viw2 didappear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view2 willdisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view2 diddisappear")
    }
    
    @IBAction func btnBack(_ sender: Any) {
        objPassData?.passData(txtFieldName1: txtField1.text!)
        objPassData?.FatherData(txtFieldName2: txtField2.text!)
        dismiss(animated: true, completion: nil)
    }
    
  
}
