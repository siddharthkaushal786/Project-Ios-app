//
//  DetalTableViewCell.swift
//  MVCPractise
//
//  Created by trainee on 26/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DetalTableViewCell: UITableViewCell {
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCompleted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
