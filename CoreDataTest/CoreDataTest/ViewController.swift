//
//  ViewController.swift
//  CoreDataTest
//
//  Created by trainee on 20/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,DataPass {
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldAddress: UITextField!
    @IBOutlet weak var txtfldCity: UITextField!
    @IBOutlet weak var txtfldMobile: UITextField!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnSaveClick(_ sender: Any) {
        let dict = ["name":txtfldName.text,"address":txtfldAddress.text,"city":txtfldCity.text,"mobile":txtfldMobile.text]
        if isUpdate{
            DataBaseHelper.sharInstance.editData(object: dict as! [String: String], i: i)
        }else{
        DataBaseHelper.sharInstance.save(object: dict as! [String : String])
        }
    }
    
    @IBAction func btnGetData(_ sender: Any) {
        
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.delegate = self 
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool){
        txtfldName.text = object["name"]
        txtfldAddress.text = object["address"]
        txtfldCity.text = object["city"]
        txtfldMobile.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
}

