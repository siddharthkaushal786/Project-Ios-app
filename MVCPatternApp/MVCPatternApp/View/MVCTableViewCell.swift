//
//  MVCTableViewCell.swift
//  MVCPatternApp
//
//  Created by trainee on 18/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class MVCTableViewCell: UITableViewCell {
   
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblClass: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
