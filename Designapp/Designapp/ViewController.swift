//
//  ViewController.swift
//  Designapp
//
//  Created by trainee on 11/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imgArr: [UIImage] = [#imageLiteral(resourceName: "Unknown"),#imageLiteral(resourceName: "place6"),#imageLiteral(resourceName: "place6"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "place5"),#imageLiteral(resourceName: "place5")]
    let placeName = ["India","America","London","England","Canada","Aus"]
    
    private var dateCellExpanded: Bool = false
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Customcell
        cell.img.image = imgArr[indexPath.row]
        cell.lblName.text = placeName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

