//
//  MyTableViewCell.swift
//  CustomTableWithDataPassing
//
//  Created by trainee on 13/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var imgPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
