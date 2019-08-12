//
//  MyTableViewCell.swift
//  Webservices
//
//  Created by trainee on 30/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblEmpName: UILabel!
    @IBOutlet weak var lblEmpSalary: UILabel!
    @IBOutlet weak var lblEmpAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
