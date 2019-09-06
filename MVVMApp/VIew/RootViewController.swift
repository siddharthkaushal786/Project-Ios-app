//
//  RootViewController.swift
//  MVVMApp
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RootViewController: UIViewController {
    
   
    var arrUserDataViewModel = [UserDataViewModel]()
    
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
   
    @IBAction func btnSave(_ sender: Any) {
      
        let objUserDataViewModel = UserDataViewModel()
        objUserDataViewModel.idStr = txtId.text!
        objUserDataViewModel.nameStr = txtName.text!
        objUserDataViewModel.hitApi()
        arrUserDataViewModel.append(objUserDataViewModel)
         objUserDataViewModel.reloadList = { [weak self] () in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
   
}
