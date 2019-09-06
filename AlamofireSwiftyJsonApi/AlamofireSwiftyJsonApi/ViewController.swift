//
//  ViewController.swift
//  AlamofireSwiftyJsonApi
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    
    
    var arrdataModel = [dataModel]()
    var swiftyJsonVar = JSON()

    @IBOutlet weak var dataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    func fetchData(){
        let url1 = URL(string: "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json")
        Alamofire.request(url1!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            if (response.result.value != nil) {
                
                
                self.swiftyJsonVar = JSON(response.result.value as Any)
            print("h7uy")
                
                               for i in 0...self.swiftyJsonVar.count-1{
                                let objDataModel = dataModel()
                                objDataModel.getData(self.swiftyJsonVar[i])
                                self.arrdataModel.append(objDataModel)
//                    let objFrienddataModel = dataModel()
//                   objFrienddataModel.getData(self.swiftyJsonVar[i])
//                    self.arrdataModel.append(objFrienddataModel)
//
                }
                self.dataTableView.reloadData()
            }
            
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdataModel[section].arrFriendModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        cell.lblData.text = arrdataModel[indexPath.section].arrFriendModel[indexPath.row].Friend
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrdataModel.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrdataModel[section].nameStr
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

