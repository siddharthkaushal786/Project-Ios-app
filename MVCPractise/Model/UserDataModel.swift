//
//  UserDataModel.swift
//  MVCPractise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class UserDataModel: NSObject {
    var userid : String?
    var id : String?
    var title : String?
    var completed : String?
    
    func dataPass(_ dict: JSON) {
        userid = dict["userId"].stringValue
      
        id = dict["id"].stringValue
       
        title = dict["title"].stringValue
        completed = dict["completed"].stringValue
       
    }
}
