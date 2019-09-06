//
//  UserViewModel.swift
//  MVVMApp
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserDataViewModel: NSObject {
  
    var objDataModel = DataModel()
    var arrDataModel = [DataModel]()
    var swiftJsonVar = JSON()
    
    var reloadList = { () -> () in }
  
    var idStr = String()
    var nameStr = String()
    
    func hitApi() {
        let url = URL(string: "https://raw.githubusercontent.com/abheesheksharma/iospublic/master/fetch.json")
        
        let parameters: [String: Any] = ["_id": idStr, "name": nameStr]
       
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseString { response in
             print(parameters)
         //   print(response)
            
            if response.result.value != nil {
                self.swiftJsonVar = JSON(response.result.value as Any)
               //print(self.swiftJsonVar)
                
                self.objDataModel.getData(self.swiftJsonVar)
                self.arrDataModel.append(self.objDataModel)
                
               // print(self.arrDataModel)
                 self.reloadList()
            } else {
                print("error")
            }
           
        }
    }
    
}
