//
//  ViewController.swift
//  DropDownMenu
//
//  Created by trainee on 23/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnCities: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectCityTapped(_ sender: Any) {
        
        btnCities.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {Button.isHidden = !Button.isHidden
                self.view.layoutIfNeeded()
            })
            
        }
    }
    
    
    
    @IBAction func btnCity1Tapped(_ sender: Any) {
        
    }
}

