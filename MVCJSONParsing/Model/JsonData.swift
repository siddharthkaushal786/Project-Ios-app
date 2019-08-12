//
//  JsonData.swift
//  MVCJSONParsing
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
class DataModel: NSObject {
    var empId : String?
    var empName: String?
    var empSalary: String?
    var empAge: String?
    
    
    func getData(_ dict: JSON){
            empId = dict["id"].stringValue
            empName = dict["employee_name"].stringValue
            empSalary = dict["employee_salary"].stringValue
            empAge = dict["employee_age"].stringValue
        
    }
    
    
}
