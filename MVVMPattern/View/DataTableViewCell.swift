//
//  DataTableViewCell.swift
//  MVVMPattern
//
//  Created by trainee on 09/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    @IBOutlet weak var lblField1: UILabel!
    @IBOutlet weak var lblField2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
