//
//  ViewController.swift
//  MVVMPattern
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var num = Int()
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var dataTableView: UITableView!
   
    var objDataViewModel = [DataViewModel]()
    
    var objDataModel = DataViewModel()
   // var arrDataModel = [DataViewModel]()
    
    @IBAction func btnAdd(_ sender: Any) {
        
        objDataModel.fetchApiData()
        objDataModel.reloadList = { [weak self] () in
            self?.dataTableView.reloadData()
        }
        
    }
  
    override func viewDidLoad() {
      
        super.viewDidLoad()
//        objDataModel.fetchApiData()
//        objDataModel.reloadList = { [weak self] () in
//            self?.dataTableView.reloadData()
        if (num % 2 == 0)
        {
            print(num)
        }
    }
        }
    
  
   
    


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objDataModel.arrDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        cell.lblField1.text = objDataModel.arrDataModel[indexPath.row].txtField1str
        cell.lblField2.text = objDataModel.arrDataModel[indexPath.row].txtField2str
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}

