//
//  ViewController.swift
//  UI Demo
//
//  Created by trainee on 02/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var promotedrewardsTableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let listingArr = ["Food & Drinks","Sports & Fitness","Computers","Cinema"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        
        promotedrewardsTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        promotedrewardsTableView.separatorColor = UIColor(red: 58/255, green: 56/255, blue: 115/255, alpha: 1)
    }
       

   
}




//TableView DataSource Method And Delegate Method
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = promotedrewardsTableView.dequeueReusableCell(withIdentifier: "cell") as! PromotedRewardTableViewCell

        cell.lblPromotedReward.text = listingArr[indexPath.row]
        cell.lblPromotedReward?.textColor = UIColor(red:254/255, green:254/255, blue:254/255, alpha: 1)
        cell.imgNext.image = UIImage(named:"Next")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

//UICollectionView Datasource And Delegate Method
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
       
        //Setting coner radius of UIViewCollection
        cell.viewCollection.clipsToBounds = true
        cell.viewCollection.layer.cornerRadius = 10
        cell.viewCollection.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        //Setting Border and color of UIView
        cell.lblView.layer.borderWidth = 2
        cell.lblView.layer.borderColor = UIColor(red:64/255, green:62/255, blue:124/255, alpha: 1).cgColor
       
        //Setting left corner radius of UIVIew
        cell.viewReDeem.clipsToBounds = true
        cell.viewReDeem.layer.cornerRadius = 10
        cell.viewReDeem.layer.maskedCorners = [.layerMinXMaxYCorner]
       
        //Setting Right coner radius of UIView
        cell.viewHeart.clipsToBounds = true
        cell.viewHeart.layer.cornerRadius = 10
        cell.viewHeart.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cell.imgHeart.image = UIImage(named: "Heart")

       //Setting Shadow of cell in UICollectionView
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width:0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath

        //Setting cornner radius if UIImage
       cell.imgKing.image = UIImage(named: "King1")
         cell.imgKing.layer.borderWidth = 1.0
         cell.imgKing.layer.masksToBounds = false
         cell.imgKing.layer.borderColor = UIColor.white.cgColor
         cell.imgKing.layer.cornerRadius = cell.imgKing.frame.size.width / 2
         cell.imgKing.clipsToBounds = true
      
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)  as? CollectionViewCell
        collectionView.bringSubviewToFront(selectedCell!)
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            selectedCell?.transform = CGAffineTransform(scaleX: 1.2, y: 2)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let unselectedCell = collectionView.cellForItem(at: indexPath)  as? CollectionViewCell
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 0, options: [], animations: {
            unselectedCell?.transform = .identity
        })
    }
}
