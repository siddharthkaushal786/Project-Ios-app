//
//  ViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import SideMenu
class ViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
     var menuArr = [(#imageLiteral(resourceName: "icons8-home-30")),(#imageLiteral(resourceName: "icons8-change-user-80")),(#imageLiteral(resourceName: "icons8-gear-200")),(#imageLiteral(resourceName: "icons8-password-reset-64")),(#imageLiteral(resourceName: "icons8-forgot-password-128"))]
    var menuItemArr = ["Home","Profile","Settings","Change Password","Forgot Password"]
     var segueIdentifier = ["HomeViewController","ProfileViewController","SettingsViewController","ChangePasswordViewController","ForgotPasswordViewController"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "cell")as! SideMenuTableViewCell
        
        cell.imgMenu.image = menuArr[indexPath.row]
        cell.lblMenu.text = menuItemArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
       // performSegue(withIdentifier: segueIdentifier[indexPath.row], sender: self)
       let vc = segueIdentifier[indexPath.row]
            let homeVC = storyboard?.instantiateViewController(withIdentifier: vc)
        self.navigationController?.pushViewController(homeVC!, animated: true)
    }
}

