//
//  ListTableViewCell.swift
//  CoreDataTest
//
//  Created by trainee on 20/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    var user:User!{
        
        didSet{
            lblName.text = user.name
            lblAddress.text = user.address
            lblCity.text = user.city
            lblMobile.text = user.mobile
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
