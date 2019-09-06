//
//  DataModel.swift
//  AlamofireSwiftyJsonApi
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class dataModel: NSObject {
    var nameStr : String?
   // var friendStr =  [String]()
    var arrFriendModel = [FriendModel]()
    
    func getData(_ dict: JSON)
    {
        nameStr = dict["name"].stringValue
        
        for j in 0..<dict["friends"].count{
            let objFriendModel = FriendModel()
            objFriendModel.handleFriendData(dict["friends"][j])
            self.arrFriendModel.append(objFriendModel)
            //friendStr.append(dict["friends"][j]["name"].stringValue)
            
        }
    }
    

}
class FriendModel{
    var Friend : String?
    func handleFriendData(_ dict : JSON)
    {
        Friend = dict["name"].stringValue
    }
}
