//
//  ViewController.swift
//  TableAppWithSectionAndRow
//
//  Created by trainee on 03/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTableView: UITableView!
    
    var objSectionData = [SectionData]()
    var sectionTitles = ["iphone","ipad","Mac"]
    var cellArr = ["iphone4","ipad 1","Mac 10.4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        objSectionData = [SectionData(sectionTitle: "iphone", isExpanded: false, conteinsUserSelectedValue: false, selectionOption: ["iphone4","iphone5","iphone6","iphone7"]),SectionData(sectionTitle: "ipad", isExpanded: false, conteinsUserSelectedValue: false, selectionOption: ["ipad 1","ipad 2","ipad 3"])]
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return objSectionData.count
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return objSectionData[section]
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if objSectionData[section].isExpanded == true {
            return objSectionData[section].selectionOption.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = dataTableView.dequeueReusableCell(withIdentifier: "TableViewSectionCell") as!ExpandedTableViewCell
            cell.lblSectionTitle.text = objSectionData[indexPath.section]
                .sectionTitle
            
            if objSectionData[indexPath.section].isExpanded == true {
                cell.lblSectionTitle.text = sectionTitles[indexPath.section]
                cell.lblSectionDetail.text = ""
            } else {
                if objSectionData[indexPath.section].conteinsUserSelectedValue == true {
                    cell.lblSectionDetail.text = "\(sectionTitles[indexPath.section]) "
                } else {
                    cell.lblSectionDetail.text = ">"
                }
            }
            return cell
            
        default:
            let cell = dataTableView.dequeueReusableCell(withIdentifier: "TableViewRowCell") as! ExpandedTableViewCell
            cell.lblRowItem.text = objSectionData[indexPath.section].selectionOption[indexPath.row - 1]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                if objSectionData.count > 2 {
                    objSectionData.removeLast()
                    dataTableView.reloadData()
                }
            case 1:
                objSectionData.append(SectionData(sectionTitle: "Mac", isExpanded: false, conteinsUserSelectedValue: false, selectionOption: ["Mac 10.1","Mac 10.2","Mac 10.3","Mac 10.4"]))
                dataTableView.reloadData()
            case 3:
                objSectionData.append(SectionData(sectionTitle: "Mac", isExpanded: false, conteinsUserSelectedValue: false, selectionOption: ["10","20","30","40"]))
                dataTableView.reloadData()
            case 4:
                if objSectionData.count > 2 {
                    objSectionData.removeLast()
                    dataTableView.reloadData()
                }
            default:
                break
            }
        }
        
        //Part B
        if indexPath.row == 0 {
            if objSectionData[indexPath.section].isExpanded == true {
                objSectionData[indexPath.section].isExpanded = false
                objSectionData[indexPath.section].sectionTitle = sectionTitles[indexPath.section]
                objSectionData[indexPath.section].conteinsUserSelectedValue = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                objSectionData[indexPath.section].isExpanded = true
                objSectionData[indexPath.section].conteinsUserSelectedValue = false
                let sections = IndexSet.init(integer: indexPath.section)
                dataTableView.reloadSections(sections, with: .none)
            }
        } else {
            objSectionData[indexPath.section].isExpanded = false
            objSectionData[indexPath.section].sectionTitle = objSectionData[indexPath.section].selectionOption[indexPath.row - 1]
            objSectionData[indexPath.section].conteinsUserSelectedValue = true
            let sections = IndexSet.init(integer: indexPath.section)
            dataTableView.reloadSections(sections, with: .none)
    }
}
}
