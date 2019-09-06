//
//  DetailViewController.swift
//  MVCPractise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController {
   
    var arrUserDataModel = [UserDataModel]()
    var swiftyjsonvar = JSON()
    
    @IBOutlet weak var dataDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
    }
    
    func getData() {
        let url = URL (string: "https://jsonplaceholder.typicode.com/todos")!
        let request = URLRequest(url: url)
        Alamofire.request(request).responseJSON { response in
          
            if (response.result.value != nil){
            
                //let dict = response.result.value as! [NSDictionary]
                self.swiftyjsonvar = JSON(response.result.value!)
                print(self.swiftyjsonvar)
           
        
                for i in 0...self.swiftyjsonvar.count-1{
                    let modelObj = UserDataModel()
                modelObj.dataPass(self.swiftyjsonvar[i])
                self.arrUserDataModel.append(modelObj)
                
                }
                self.dataDetailTableView.reloadData()
 
                
            }
        }
        
    }
    
    }
    


extension DetailViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return arrUserDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataDetailTableView.dequeueReusableCell(withIdentifier: "DetalTableViewCell") as! DetalTableViewCell
        cell.lblUserId.text = arrUserDataModel[indexPath.row].userid
        cell.lblId.text = arrUserDataModel[indexPath.row].id
        cell.lblTitle.text = arrUserDataModel[indexPath.row].title
        cell.lblCompleted.text = arrUserDataModel[indexPath.row].completed
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
