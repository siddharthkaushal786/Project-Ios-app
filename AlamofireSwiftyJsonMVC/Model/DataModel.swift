//
//  DataModel.swift
//  AlamofireSwiftyJsonMVC
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class DataModel: NSObject {
    var id : String?
    var index : String?
    var guide : String?
    var isActive : String?
    var balance : String?
    var picture : String?
    var age : String?
    var eyecolor : String?
    var name : String?
    var gender : String?
    var company : String?
    var email : String?
    var phone : String?
    var address : String?
    var about : String?
    var lattitude : String?
     var longitude : String?
    
    func getData(_ dict: JSON){
         id = dict["_id"].stringValue
         index = dict["index"].stringValue
         guide = dict["guid"].stringValue
         isActive = dict["isActive"].stringValue
         balance = dict["balance"].stringValue
         picture = dict["picture"].stringValue
         age = dict["age"].stringValue
         eyecolor = dict["eyeColor"].stringValue
         name = dict["name"].stringValue
        gender = dict["gender"].stringValue
        company = dict["company"].stringValue
        email = dict["email"].stringValue
        phone = dict["phone"].stringValue
        address = dict["address"].stringValue
        about = dict["about"].stringValue
        lattitude = dict["latitude"].stringValue
        longitude = dict["longitude"].stringValue
       
        
    }
}
