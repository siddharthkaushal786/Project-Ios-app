//
//  DIctViewController.swift
//  Testapp
//
//  Created by trainee on 10/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DIctViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    //let dict = NSMutableDictionary()
    let  userArr = NSMutableArray()
    var locArr = Int()
    @IBOutlet weak var updateBtn: UIButton!
    @IBOutlet weak var nametxt: UITextField!
    @IBOutlet weak var classtxt: UITextField!
    @IBOutlet weak var idtxt: UITextField!
    @IBOutlet weak var sectiontxt: UITextField!
    @IBOutlet weak var dictTableView: UITableView!

  
    @IBAction func btnAdd(_ sender: Any) {
        
        let dict = NSMutableDictionary()
        
            dict.setValue(nametxt.text!, forKey: "name")
            dict.setValue(classtxt.text!, forKey: "class")
            dict.setValue(idtxt.text!, forKey: "id")
            dict.setValue(sectiontxt.text!, forKey: "section")
            userArr.add(dict)
        
        nametxt.text = ""
        classtxt.text = ""
        idtxt.text = ""
        sectiontxt.text = ""
        dictTableView.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Dictcell


//cell.dictlbl.text = self.userArr[indexPath.row] as? String
        let cellData = userArr[indexPath.row] as! NSMutableDictionary
        
        cell.dictlbl.text = cellData["name"] as? String
        cell.dictlbl1.text = cellData["class"] as? String
        cell.dictlbl2.text = cellData["id"] as? String
        cell.dictlbl3.text = cellData["section"] as? String
       
//let text = self.userArr[indexPath.row]
//cell.dictlbl.text = self.userArr[indexPath.row] as? String
       // cell.dictlbl.text = self.userArr["name"] as! String
       // cell.dictlbl.text = text as? String
        
        return cell
     
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userArr.removeObject(at: indexPath.row)
            dictTableView.reloadData()

        }
    }
    
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let dictCell = userArr[indexPath.row] as! NSMutableDictionary
        locArr = indexPath.row

      nametxt.text = dictCell["name"] as? String
         classtxt.text = dictCell["class"] as? String
         idtxt.text = dictCell["id"] as? String
         sectiontxt.text = dictCell["section"] as? String
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        let indexpath = IndexPath(row: locArr, section: 0)
        
        let dictCell = userArr[indexpath.row] as! NSMutableDictionary
        
        dictCell["name"] = nametxt.text
        dictCell["class"] = classtxt.text
        dictCell["id"] = idtxt.text
        dictCell["section"] = sectiontxt.text
        
        nametxt.text = ""
        classtxt.text = ""
        idtxt.text = ""
        sectiontxt.text = ""
    dictTableView.reloadData()
    }

}
