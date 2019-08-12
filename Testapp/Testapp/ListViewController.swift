//
//  ListViewController.swift
//  Testapp
//
//  Created by trainee on 10/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    let placesImage: [UIImage] = [
        UIImage(named: "places2")!,
         UIImage(named: "place1")!,
          UIImage(named: "places2")!,
           UIImage(named: "places2")!,
            UIImage(named: "place1")!,
             UIImage(named: "place1")!
    ]
    
let places: [String] = ["India", "Cow", "Camel", "Sheep", "Goat"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTableview: UITableView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! myCell
        
        // Configure the cell
        cell.imgCollection.image = placesImage[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Customcell
        
        // let text = data[indexPath.row]
        cell.mylbl.text = self.animals[indexPath.row]
        //cell.label.text = text
        
        return cell
    }
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        
    }
    

}

extension ListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = UIScreen.main.bounds.width
        return CGSize(width: itemSize/3-1, height: itemSize/3-1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



