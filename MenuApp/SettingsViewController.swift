//
//  SettingsViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
 var sectionArr = ["ACCOUNT","PUSH NOTIFICATION","GET HELP"]
    var userArr = [["Mavrick Danger", "Private Account"], ["New Deals", "Facebook Friend Joins", "Friends Like My Activity"], ["Contact Us"]]
    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
   
    @IBAction func btnSettings(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
//        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionArr[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "cell") as! SettingTableViewCell

        cell.lblSetting.text = userArr[indexPath.section][indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

