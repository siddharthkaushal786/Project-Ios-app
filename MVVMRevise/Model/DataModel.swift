//
//  DataModel.swift
//  MVVMRevise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class userModel: NSObject{
    var userid = Int()
    var id = Int()
    var title : String?
    var completed = Bool()
    
    func getData(_ dict: JSON){
        userid = dict["userId"].intValue
        
        id = dict["id"].intValue
        title = dict["title"].stringValue
        completed = dict["userId"].boolValue
        
        
    }
}
