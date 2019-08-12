//
//  DataModelViewController.swift
//  MVCPatternApp
//
//  Created by trainee on 18/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DataModelViewController: UIViewController {
    
    class DataModel: NSObject{
        var nameStr: String?
        var classStr: String?
        
        func getData(_ dict: NSMutableDictionary){
            nameStr = dict["name"] as? String
            classStr = dict["class"] as? String
        }
    
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
}
