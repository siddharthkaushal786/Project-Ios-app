//
//  ViewController.swift
//  AlamofireSwiftyJson
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var contentTableView: UITableView!
    var objAPIDataModel = APIDataModel()
    var userArr = [APIDataModel]()
    var swiftyJsonVar = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchData()
    }

    func fetchData() {
        let url1 = URL (string: "http://dummy.restapiexample.com/api/v1/employees")
 
        Alamofire.request(url1!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            if((response.result.value) != nil) {
                self.swiftyJsonVar = JSON(response.result.value!)
                print(self.swiftyJsonVar)

                self.objAPIDataModel.getData(self.swiftyJsonVar)
                self.userArr.append(self.objAPIDataModel)

                self.contentTableView.reloadData()
            }
            
           
            
        }
        
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swiftyJsonVar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.lblId.text = swiftyJsonVar[indexPath.row]["id"].stringValue
        cell.lblName.text = swiftyJsonVar[indexPath.row]["employee_name"].stringValue
        cell.lblSalary.text = swiftyJsonVar[indexPath.row]["employee_salary"].stringValue
        cell.lblAge.text = swiftyJsonVar[indexPath.row]["employee_age"].stringValue
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
