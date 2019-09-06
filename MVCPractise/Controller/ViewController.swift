//
//  ViewController.swift
//  MVCPractise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let objeUserDataModel = UserDataModel()
    @IBOutlet weak var txtfldUserId: UITextField!
    @IBOutlet weak var txtfldId: UITextField!
    @IBOutlet weak var txtfldTitle: UITextField!
    @IBOutlet weak var txtfldCompleted: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
  
    @IBAction func actionbtnAdd(_ sender: Any) {
        let dict = NSMutableDictionary()
        
        dict.setValue(txtfldUserId.text, forKey: "userId")
        dict.setValue(txtfldId.text, forKey: "id")
        dict.setValue(txtfldTitle.text, forKey: "title")
        dict.setValue(txtfldCompleted.text, forKey: "completed")
        
     //   objeUserDataModel.dataPass(dict)
         txtfldUserId.text = ""
         txtfldId.text = ""
         txtfldTitle.text = ""
         txtfldCompleted.text = ""
        
    }
    

}
