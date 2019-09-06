//
//  ListViewController.swift
//  CoreDataTest
//
//  Created by trainee on 20/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
protocol DataPass {
    func data(object:[String:String], index:Int, isEdit: Bool)
}


class ListViewController: UIViewController {
    
    var user = [User]()
    var delegate: DataPass!
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
user = DataBaseHelper.sharInstance.getData()
        
    }
    


}
extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        cell.user = user[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            user = DataBaseHelper.sharInstance.deleteData(index: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":user[indexPath.row].name,"address":user[indexPath.row].address,"city":user[indexPath.row].city,"mobile":user[indexPath.row].mobile]
       delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }
}
