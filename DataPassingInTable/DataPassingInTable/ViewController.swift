//
//  DIctViewController.swift
//  Testapp
//
//  Created by trainee on 10/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    let  userArr = NSMutableArray()
    var locArr = Int()
 
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var classtxt: UITextField!
    
    @IBOutlet weak var dataTableView: UITableView!
    @IBAction func addActionClick(_ sender: Any) {
       
            
            let dict = NSMutableDictionary()
            
            dict.setValue(nameText.text!, forKey: "name")
            dict.setValue(classtxt.text!, forKey: "class")
            
            userArr.add(dict)
            
            nameText.text = ""
            classtxt.text = ""
            
            dataTableView.reloadData()
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        let indexpath = IndexPath(row: locArr, section: 0)
        
        let dictCell = userArr[indexpath.row] as! NSMutableDictionary
        
        dictCell["name"] = nameText.text
        dictCell["class"] = classtxt.text
        
        
        nameText.text = ""
        classtxt.text = ""
       
        dataTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let cellData = userArr[indexPath.row] as! NSMutableDictionary
        
        cell.lblName.text = cellData["name"] as? String
        cell.lblClass.text = cellData["class"] as? String
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userArr.removeObject(at: indexPath.row)
            dataTableView.reloadData()
            
        }
    }
    
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dictCell = userArr[indexPath.row] as! NSMutableDictionary
       // locArr = indexPath.row
        
        nameText.text = dictCell["name"] as? String
        classtxt.text = dictCell["class"] as? String
        
        dataTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
}
