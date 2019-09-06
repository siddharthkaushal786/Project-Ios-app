//
//  ViewController.swift
//  ExpandedTableView
//
//  Created by trainee on 06/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
struct  tableData {
     var isExpended = Bool()
    var secTitle = String()
    var cellTitle = [String]()
}



class ViewController: UIViewController {
   var  secTitles = ["iphone","iPad","Mac"]
    var tableArr = [tableData(isExpended: false, secTitle: "iphone", cellTitle: ["iphone4","iphone5","iphone6","iphone7","iphone8"]),
                    tableData(isExpended: false, secTitle: "iPad",   cellTitle: ["iPad1","iPad2","iPad3"]),
                    tableData(isExpended: false, secTitle: "Mac",    cellTitle: ["Mac 10.0","Mac 10.1","Mac 10.2","Mac 10.3","Mac 10.4"])]
    
    @IBOutlet weak var dataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // For removing the extra empty spaces of TableView below
        dataTableView.tableFooterView = UIView()
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableArr.count
    }
    
   
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableArr[section].isExpended == true {
            return tableArr[section].cellTitle.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = dataTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.lblData.text = tableArr[indexPath.section].secTitle
            return cell
        } else {
            let cell = dataTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            cell.lblData.text = tableArr[indexPath.section].cellTitle[indexPath.row - 1]
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableArr[indexPath.section].isExpended == true {
            tableArr[indexPath.section].isExpended = false
            let section = IndexSet.init(integer: indexPath.section)
            dataTableView.reloadSections(section, with: .none)
        } else {
            tableArr[indexPath.section].isExpended = true
            let section = IndexSet.init(integer: indexPath.section)
            dataTableView.reloadSections(section, with: .none)
        }

        }
    }
    


