//
//  RootViewController.swift
//  AlamofireSwiftyJsonMVC
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
class RootViewController: UIViewController {
    
    
    var arrDataModel = [DataModel]()
    var swiftyJson = JSON()
    @IBOutlet weak var dataTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     fetchData()
    }
    
    func fetchData() {
        let url1 = URL(string: "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json")
         Alamofire.request(url1!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            if((response.result.value) != nil) {
                self.swiftyJson = JSON(response.result.value!)
                //print(self.swiftyJson)
                for i in 0...self.swiftyJson.count-1{
                    let objDataModel = DataModel()
                    objDataModel.getData(self.swiftyJson[i])
                    self.arrDataModel.append(objDataModel)
                   // print(self.arrDataModel)
                }
                self.dataTableView.reloadData()
            }
    }


}
 
}


extension RootViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return arrDataModel.count
        
    
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell") as! APIDataTableViewCell
     
        cell.lblId.text = arrDataModel[indexPath.row].id
         cell.lblIndex.text = arrDataModel[indexPath.row].index
         cell.lblGuide.text = arrDataModel[indexPath.row].guide
         cell.lblActive.text = arrDataModel[indexPath.row].isActive
         cell.lblBalance.text = arrDataModel[indexPath.row].balance
        
        let url = URL(string: "http://placehold.it/32x32")!
       cell.imgPicture.af_setImage(withURL: url, placeholderImage: nil)
        
        cell.lblAge.text = arrDataModel[indexPath.row].age
         cell.lblEyeColor.text = arrDataModel[indexPath.row].eyecolor
        cell.lblName.text = arrDataModel[indexPath.row].name
        cell.lblGender.text = arrDataModel[indexPath.row].gender
        cell.lblCompany.text = arrDataModel[indexPath.row].company
        cell.lblEmail.text = arrDataModel[indexPath.row].email
        cell.lblPhone.text = arrDataModel[indexPath.row].phone
        cell.lblAddress.text = arrDataModel[indexPath.row].address
        cell.txtviewAbout.text = arrDataModel[indexPath.row].about
        cell.lblLatitude.text = arrDataModel[indexPath.row].lattitude
        cell.lblLongitude.text = arrDataModel[indexPath.row].longitude
        
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
