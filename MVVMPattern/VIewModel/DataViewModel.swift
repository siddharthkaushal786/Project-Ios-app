//
//  DataViewModel.swift
//  MVVMPattern
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DataViewModel {
    
    var reloadList = {() -> () in }
     var objDataModel = DataModel()
    var arrDataModel = [DataModel]()
    var dataJson = JSON()
    
    
    
    func fetchApiData(){
        
        let Parameters = ["_id": objDataModel.txtField1str, "name": objDataModel.txtField2str]
        
        let url1 = URL(string: "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json")!
        
        Alamofire.request(url1, method: .post, parameters: Parameters as Parameters, encoding: JSONEncoding.default, headers: nil).responseString {response in
            
        
        
//        let url = URL(string: "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json")
//        Alamofire.request(url!).responseJSON { response in
            if response.result.value != nil{
                self.dataJson = JSON(response.result.value as Any)
               
                for i in 0...self.dataJson.count-1{
                    let objDataModel = DataModel()
                    objDataModel.getData(self.dataJson[i])
                    self.arrDataModel.append(objDataModel)
                }
                self.reloadList()
            } else {
                print("error")
            }
        }
    }
    
}
