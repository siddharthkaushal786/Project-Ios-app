//
//  DataTableViewCell.swift
//  Webservices
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
