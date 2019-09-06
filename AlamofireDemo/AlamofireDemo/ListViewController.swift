//
//  ListViewController.swift
//  AlamofireDemo
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire

class ListViewController: UIViewController {

    var userArr = [AnyObject]()
    
    @IBOutlet weak var listTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
       
    }
  
   func fetchData() {
        let url1 = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
        Alamofire.request(url1!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        
            if let dict = response.result.value as? [AnyObject] {
             
                self.userArr = dict 
                print(self.userArr)
        self.listTableView.reloadData()
            } else {
                print("error")
            }
}
}

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return userArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = listTableView.dequeueReusableCell(withIdentifier: "cell") as! GetTableViewCell
        cell.lblId.text = userArr[indexPath.row]["id"] as? String
        cell.lblEmpName.text = userArr[indexPath.row]["employee_name"] as? String
        cell.lblEmpAge.text = userArr[indexPath.row]["employee_salary"] as? String
        cell.lblEmpSalary.text = userArr[indexPath.row]["employee_age"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

