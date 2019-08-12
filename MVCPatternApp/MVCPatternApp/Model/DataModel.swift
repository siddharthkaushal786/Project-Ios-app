//
//  DataModel.swift
//  MVCPatternApp
//
//  Created by trainee on 19/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit

class DataModel: NSObject{
    var nameStr: String?
    var classStr: String?
    
    func getData(_ dict: NSMutableDictionary){
        nameStr = dict["name"] as?String
        classStr = dict["class"] as? String
    
    }
}
