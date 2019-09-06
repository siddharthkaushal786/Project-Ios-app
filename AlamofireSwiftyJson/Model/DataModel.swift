//
//  DataModel.swift
//  AlamofireSwiftyJson
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
class APIDataModel: NSObject {
    var empId : String?
    var empName : String?
    var empSalary : String?
    var empAge : String?
    
    func getData(_ dict: JSON) {
        empId = dict["id"].stringValue
        empName = dict["employee_name"].stringValue
         empSalary = dict["employee_salary"].stringValue
         empAge = dict["employee_age"].stringValue
    }
}
