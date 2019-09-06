//
//  SideMenuViewController.swift
//  SideMenu
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
//import SideMenu

class SideMenuViewController: UIViewController {
    @IBOutlet weak var btnsideMenu: UIButton!
    @IBAction func btnSideMenu(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationcomplete) in
            print("animation is complete")
        }
        
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

       
    }
    


}
