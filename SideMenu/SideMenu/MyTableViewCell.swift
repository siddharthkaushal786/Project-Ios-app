//
//  MyTableViewCell.swift
//  SideMenu
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblSideMenu: UILabel!
    @IBOutlet weak var btnSide: UIButton!
    @IBOutlet weak var imgSideMenu: UIImageView!
    @IBAction func btnSideMenu(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
