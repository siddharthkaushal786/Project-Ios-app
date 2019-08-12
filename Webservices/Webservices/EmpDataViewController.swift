//
//  EmpDataViewController.swift
//  Webservices
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire

class EmpDataViewController: UIViewController {
    @IBOutlet weak var jsondataTableView: UITableView!
    
    var userArr = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchData()
        
    }
    
    func fetchData(){
        let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
        let urlRequest = URLRequest(url: url)
        
        
        Alamofire.request(urlRequest)
            .responseJSON { response in
                
                if let dict = response.result.value as? [[String: Any]]{
                   
                    let newDict = dict as [NSDictionary]
                    
                    self.userArr = newDict as [AnyObject]

                    print( self.userArr)
                   self.jsondataTableView.reloadData()
                    
                }else{
                    print("error")
                }
                
                
        }
        
    }
}
  


extension EmpDataViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return userArr.count
       
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = jsondataTableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
     //  let cellData = userArr[indexPath.row]["employee_name"] as? [[String: Any]]
        cell.lblID.text = userArr[indexPath.row]["id"] as? String
        cell.lblEmpName.text = userArr[indexPath.row]["employee_name"] as? String
        cell.lblEmpSalary.text = userArr[indexPath.row]["employee_salary"] as? String
        cell.lblEmpAge.text = userArr[indexPath.row]["employee_age"] as? String
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
