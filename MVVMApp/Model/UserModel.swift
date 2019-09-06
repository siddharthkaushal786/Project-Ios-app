//
//  UserModel.swift
//  MVVMApp
//
//  Created by trainee on 12/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataModel: NSObject {
    var idStr : String?
    var nameStr : String?
    
    func getData(_ dict: JSON){
        idStr = dict["_id"].stringValue
        nameStr = dict["name"].stringValue
    }
}
