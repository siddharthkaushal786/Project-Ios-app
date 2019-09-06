//
//  UserViewModel.swift
//  MVVMRevise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DataViewModel{
   
    var arrUserModel = [userModel]()
    var swuftJsonvar = JSON()
    var reloadData = {() -> () in }
    func fetchApi(){
       
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        let urlRequest = URLRequest(url: url!)
        Alamofire.request(urlRequest).responseJSON { response in
   
                if response.result.value != nil{
                    self.swuftJsonvar = JSON(response.result.value as Any)
              
                
                    for i in 0...self.swuftJsonvar.count-1{
                     let objUserModel = userModel()
                    objUserModel.getData(self.swuftJsonvar[i])
                    self.arrUserModel.append(objUserModel)
                }
                self.reloadData()
            }
            else {
                print("error")
            }
        }
        
    }
}
