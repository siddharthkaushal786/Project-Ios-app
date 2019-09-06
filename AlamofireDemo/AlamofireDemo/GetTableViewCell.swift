//
//  GetTableViewCell.swift
//  AlamofireDemo
//
//  Created by trainee on 06/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class GetTableViewCell: UITableViewCell {
    @IBOutlet weak var lblId: UILabel!
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
