//
//  MVCViewController.swift
//  MVCPatternApp
//
//  Created by trainee on 18/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class MVCViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtClass: UITextField!
    @IBOutlet weak var dataTableView: UITableView!
    
    var arrDataModel = [DataModel]()
    var locArr = Int()
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    @IBAction func btnAdd(_ sender: Any) {
        
        let dataDict = NSMutableDictionary()
        dataDict.setValue(txtName.text!, forKey: "name")
        dataDict.setValue(txtClass.text!, forKey: "class")
        let objDataModel = DataModel()
        objDataModel.getData(dataDict)
        arrDataModel.append(objDataModel)
        
        txtName.text = ""
        txtClass.text = ""
        
        dataTableView.reloadData()
        
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
     
        arrDataModel[locArr].nameStr = txtName.text
        arrDataModel[locArr].classStr = txtClass.text
        
        txtName.text = ""
        txtClass.text = ""
        dataTableView.reloadData()
        
    }
    
    
}
extension MVCViewController: UITableViewDataSource, UITableViewDelegate{
   
    //TableView DataSource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  arrDataModel.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MVCTableViewCell
        cell.lblName.text = arrDataModel[indexPath.row].nameStr
        cell.lblClass.text = arrDataModel[indexPath.row].classStr
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 50
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrDataModel.remove(at: indexPath.row)
            dataTableView.reloadData()
        }
    }
    
    //TableView Delegate Method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        txtName.text = arrDataModel[indexPath.row].nameStr
        txtClass.text = arrDataModel[indexPath.row].classStr
        locArr = indexPath.row
     
    }
    
    
}
