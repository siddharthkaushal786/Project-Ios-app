//
//  Customcell.swift
//  Designapp
//
//  Created by trainee on 11/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class Customcell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
