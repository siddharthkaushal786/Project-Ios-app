//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var userArr = ["Car","Bike","Plane","Motor","Plane"]
    var userArr1 = ["Apple","Banana","Litchi","Grapes","Melon"]
    
    @IBOutlet weak var viewCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return (section == 0) ? userArr.count : userArr1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.lblData.text = userArr[indexPath.row]
        return cell
    }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! MyCollectionViewCell
            cell.lblData1.text = userArr1[indexPath.row]
            return cell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
}

