//
//  CalloutViewController.swift
//  MapKitDemo
//
//  Created by trainee on 28/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class CalloutViewController: UIViewController {
  
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPlace: UIImageView!
    
    var titleStr = ""
    let img = UIImage(named: "king")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = titleStr
        imgPlace.image = img

    }
    

}
