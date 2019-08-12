//
//  TableViewDataModel.swift
//  Tableapp
//
//  Created by trainee on 19/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import UIKit

class DataModel: NSObject {
    
    var namestr: String?
    var classstr: String?
    
    func getData(_ dict:NSMutableDictionary){
        namestr = dict["name"] as? String
        classstr = dict["class"] as? String
    }
}
