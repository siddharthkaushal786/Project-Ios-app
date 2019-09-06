//
//  ViewController.swift
//  CustomTableWithDataPassing
//
//  Created by trainee on 13/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dataTableView: UITableView!
    
    var dataArr = ["CHD.","Mohali","Panchkula","Zirkpur","Patiala","Rajpura","Kharar"]
    var imgArr = [#imageLiteral(resourceName: "pngtree-red-wavy-shapes-abstract-on-transparent-background-image_111969"),#imageLiteral(resourceName: "icons8-home-30"),#imageLiteral(resourceName: "place6"),#imageLiteral(resourceName: "icons8-sofa-48"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "Unknown1"),#imageLiteral(resourceName: "icons8-car-40")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTableView.dequeueReusableCell(withIdentifier: "cell") as! MyTableViewCell
        cell.lblData.text = dataArr[indexPath.row]
        cell.imgPic.image = imgArr[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.imgStr = imgArr[indexPath.row]
        detailVC.lblDataStr = dataArr[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           dataArr.remove(at: indexPath.row)
            imgArr.remove(at: indexPath.row)
            dataTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
