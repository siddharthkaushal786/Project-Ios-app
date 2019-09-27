//
//  ProductTableViewCell.swift
//  AddProductWithCoreData
//
//  Created by trainee on 17/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductId: UILabel!
    @IBOutlet weak var lblProductDetail: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    
    var item:Product!{
        didSet{
            lblProductId.text = item.id
            lblProductName.text = item.name
            lblProductPrice.text = item.price
            lblProductDetail.text = item.detail
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
