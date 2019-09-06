//
//  ViewController.swift
//  MVVMRevise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arrDataViewModel = [DataViewModel]()
    var objDataViewModel = DataViewModel()
    @IBOutlet weak var dataTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        objDataViewModel.fetchApi()
        objDataViewModel.reloadData = { [weak self] () in
        self?.dataTableView.reloadData()
    }
   
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objDataViewModel.arrUserModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.lblUserId.text = String(objDataViewModel.arrUserModel[indexPath.row].userid)
        cell.lblId.text = String(objDataViewModel.arrUserModel[indexPath.row].id)
        cell.lblTitle.text = objDataViewModel.arrUserModel[indexPath.row].title
        cell.lblComleted.text = String(objDataViewModel.arrUserModel[indexPath.row].completed)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
