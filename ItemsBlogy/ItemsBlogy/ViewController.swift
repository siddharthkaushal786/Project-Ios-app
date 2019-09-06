//
//  ViewController.swift
//  ItemsBlogy
//
//  Created by trainee on 15/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
     @IBOutlet weak var collectionView: UICollectionView!
   
    @IBOutlet weak var myTabbar: UITabBar!
    
    @IBOutlet weak var newsTab: UITabBarItem!
    @IBOutlet weak var browseTab: UITabBarItem!
    @IBOutlet weak var favouriteTab: UITabBarItem!
    @IBOutlet weak var profileTab: UITabBarItem!
    var img: [UIImage] = []
    var arr = NSMutableArray()
    
    
   
    override func viewDidLoad() {
        img = [#imageLiteral(resourceName: "place2"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "place1"),#imageLiteral(resourceName: "place2")]
        arr = ["place1","place2","place3","place4","place5","place6"]
        
      
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Bloggycell
        
        cell.imgCollection.image = self.img[indexPath.row]
        cell.lblPlace.text = self.arr[indexPath.row] as? String
        print(cell)
        return cell
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = UIScreen.main.bounds.width
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
   
}

