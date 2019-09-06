//
//  ViewController.swift
//  SideMenu
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var sidemenuTableView: UITableView!
    
    var nameArr = ["City","Country","State","Car","Bike","Furniture","Plane"]
    var imgArr = [(#imageLiteral(resourceName: "icons8-city-50")),(#imageLiteral(resourceName: "icons8-country-16")),(#imageLiteral(resourceName: "icons8-active-state-40")),(#imageLiteral(resourceName: "icons8-car-40")),(#imageLiteral(resourceName: "icons8-dirt-bike-50")),(#imageLiteral(resourceName: "icons8-sofa-48")),(#imageLiteral(resourceName: "icons8-airplane-16"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sidemenuTableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        cell.imgSideMenu.image = imgArr[indexPath.row]
        cell.lblSideMenu.text = nameArr[indexPath.row]
        cell.btnSide.setImage(UIImage(named: "icons8-more-than-50"), for: UIControl.State.normal)
     return cell
    
    }
    
    
}
