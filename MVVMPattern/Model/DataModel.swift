//
//  DataModel.swift
//  MVVMPattern
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class DataModel: NSObject {
    var txtField1str : String?
    var txtField2str : String?
    
    func getData(_ dict: JSON){
        txtField1str = dict["_id"].stringValue
         txtField2str = dict["name"].stringValue
    }
   
}

