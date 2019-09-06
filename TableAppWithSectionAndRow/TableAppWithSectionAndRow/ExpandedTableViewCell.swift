//
//  ExpandedTableViewCell.swift
//  TableAppWithSectionAndRow
//
//  Created by trainee on 04/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ExpandedTableViewCell: UITableViewCell {
    @IBOutlet weak var lblSectionTitle: UILabel!
    
    @IBOutlet weak var lblSectionDetail: UILabel!
    
    @IBOutlet weak var lblRowItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
