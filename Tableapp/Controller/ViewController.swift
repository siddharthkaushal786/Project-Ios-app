//
//  ViewController.swift
//  Tableapp
//
//  Created by trainee on 19/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtClass: UITextField!
    @IBOutlet weak var dataTableView: UITableView!
    var arrDataModel = [DataModel]()
    var locArr = Int()
    
    @IBAction func btnAdd(_ sender: Any) {
        
        let objDataModel = NSMutableDictionary()
       
        objDataModel.setValue(txtName.text!, forKey: "name")
        objDataModel.setValue(txtClass.text!, forKey: "class")
        
        let objData = DataModel()
        objData.getData(objDataModel)
        arrDataModel.append(objData)
        
        txtName.text = ""
        txtClass.text = ""
        
        dataTableView.reloadData()
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        
      arrDataModel[locArr].namestr = txtName.text
        arrDataModel[locArr].classstr = txtClass.text
        txtClass.text = ""
        dataTableView.reloadData()
        
    }
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        
        super.viewDidLoad()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier:
            "cell") as! MyTableViewCell
        
        cell.lblName.text = arrDataModel[indexPath.row].namestr
        cell.lblClass.text = arrDataModel[indexPath.row].classstr
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        txtName.text = arrDataModel[indexPath.row].namestr
        txtClass.text = arrDataModel[indexPath.row].classstr
        locArr = indexPath.row
    }
   
}
