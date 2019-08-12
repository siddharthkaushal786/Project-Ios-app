//
//  ViewController.swift
//  MVCJSONParsing
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var dataTableView: UITableView!
   
    var arrDataModel = [DataModel]()
    let objDataModel = DataModel()
    var swiftyJsonVar = JSON(String())
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

                    if((response.result.value) != nil) {
                        self.swiftyJsonVar = JSON(response.result.value!)
                        print(self.swiftyJsonVar)
                        
                        self.objDataModel.getData(self.swiftyJsonVar)
                        self.arrDataModel.append(self.objDataModel)
                        
                        self.dataTableView.reloadData()
           }
                }
        }
    }
                    
//                    for i in 0...newDict.count-1{
//                        self.objDataModel.getData(newDict[i])
//                        self.arrDataModel.append(self.objDataModel)
//
//                    }
//
//
//
//        print(self.arrDataModel)
//
//
//                   // self.userArr = newDict as [AnyObject]
//
//
//                    self.dataTableView.reloadData()
//
//                }else{
//                    print("error")
//                }
             
//        }
//
//    }
//    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftyJsonVar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell

        cell.lblId.text = swiftyJsonVar[indexPath.row]["id"].stringValue
        cell.lblEmpName.text = swiftyJsonVar[indexPath.row]["employee_name"].stringValue
        cell.lblEmpSalary.text = swiftyJsonVar[indexPath.row]["employee_name"].stringValue
        cell.lblEmpAge.text = swiftyJsonVar[indexPath.row]["employee_age"].stringValue

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

