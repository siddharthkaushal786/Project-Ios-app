//
//  AlamofirTableViewCell.swift
//  FitnessApp
//
//  Created by trainee on 26/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class AlamofirTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
