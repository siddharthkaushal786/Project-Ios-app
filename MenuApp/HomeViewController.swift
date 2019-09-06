//
//  HomeViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dropShadow()
        buttonShadow()
        txtFieldShadow()
    }
    
    // Set Home view coner and shadow
    func dropShadow(scale: Bool = true) {
        
        viewHome.layer.masksToBounds = false
        viewHome.layer.cornerRadius = 10
        viewHome.backgroundColor = UIColor(red: 172/255, green: 45/255, blue: 97/255, alpha: 1.0)
        viewHome.layer.shadowColor = UIColor.green.cgColor
        viewHome.layer.shadowOpacity = 0.6
        viewHome.layer.shadowOffset = .zero
        viewHome.layer.shadowRadius = 15.0
        viewHome.layer.shadowPath = UIBezierPath(rect: viewHome.bounds).cgPath
        viewHome.layer.shouldRasterize = true
        viewHome.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
   
    //set Button corner and shadow
    func buttonShadow(scale: Bool = true){
        btnLogin.layer.masksToBounds = false
        btnLogin.layer.cornerRadius = 10
        btnLogin.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnLogin.layer.shadowColor = UIColor.blue.cgColor
        btnLogin.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnLogin.layer.shadowRadius = 15.0
        btnLogin.layer.shouldRasterize = true
        btnLogin.layer.shadowOpacity = 0.6
        btnLogin.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
    
    //Set Textfield corner and shadow
    func txtFieldShadow(scale: Bool = true) {
        txtField1.layer.masksToBounds = false
        txtField1.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtField1.layer.shadowColor = UIColor.blue.cgColor
        txtField1.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtField1.layer.shadowRadius = 15.0
        txtField1.layer.shouldRasterize = true
        txtField1.layer.shadowOpacity = 0.6
        txtField1.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        txtField2.layer.masksToBounds = false
        txtField2.layer.cornerRadius = 10
        //txtField1.backgroundColor = UIColor.blue
        txtField2.layer.shadowColor = UIColor.blue.cgColor
        txtField2.layer.shadowOffset = CGSize(width: 2, height: 2)
        txtField2.layer.shadowRadius = 15.0
        txtField2.layer.shouldRasterize = true
        txtField2.layer.shadowOpacity = 0.6
        txtField2.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    @IBAction func btnHome(_ sender: Any) {
        
//        let Vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
//    self.navigationController?.popToRootViewController(animated: true)
    }
}
