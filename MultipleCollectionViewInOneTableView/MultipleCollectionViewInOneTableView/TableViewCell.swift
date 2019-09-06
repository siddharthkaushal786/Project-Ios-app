//
//  TableViewCell.swift
//  MultipleCollectionViewInOneTableView
//
//  Created by trainee on 30/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
     var arrCollection = [#imageLiteral(resourceName: "facebook"),#imageLiteral(resourceName: "change"),#imageLiteral(resourceName: "Fitness"),#imageLiteral(resourceName: "king"),#imageLiteral(resourceName: "Home"),#imageLiteral(resourceName: "boy"),#imageLiteral(resourceName: "icons8-car-40"),#imageLiteral(resourceName: "forgot"),#imageLiteral(resourceName: "changepwd")]
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
       
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
//
//         arrCollection = ["king","king","king","king","king","king","king","king","king"]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TableViewCell:UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        {
          
            cell.imgCollectionViewCell.image = arrCollection[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let size = CGSize(width: 120, height: 120)
        return size
    }
   
}
