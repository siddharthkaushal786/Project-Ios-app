//
//  ViewController.swift
//  Webservices
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

   
    var empId = [String]()
    var emplyNameArr = [String]()
    var empAge = [String]()
    var empSalary = [String]()
    
    @IBOutlet weak var fetchdataTableView: UITableView!
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
//
                    var newDict = dict as [NSDictionary]
             

                    print(dict)

                    for result in 0...newDict.count-1{
                        self.empId.append(newDict[result]["id"] as! String)
                        self.emplyNameArr.append(newDict[result]["employee_name"] as! String)
                        self.empAge.append(newDict[result]["employee_age"] as! String)
                        self.empSalary.append(newDict[result]["employee_salary"] as! String)
                        
                       // print(<#T##items: Any...##Any#>)
                    }

                    self.fetchdataTableView.reloadData()
                    
                }else{
                    print("error")
                }
                
              
                }
 
        }
    }
    

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return newArray.count
        return emplyNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fetchdataTableView.dequeueReusableCell(withIdentifier: "cell") as! DataTableViewCell
        
        
        cell.lblData.text = emplyNameArr[indexPath.row] as? String
         cell.lblId.text = empId[indexPath.row] as? String
         cell.lblAge.text = empAge[indexPath.row] as? String
          cell.lblSalary.text = empSalary[indexPath.row] as? String
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
