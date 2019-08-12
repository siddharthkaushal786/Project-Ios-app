//
//  Dictcell.swift
//  Testapp
//
//  Created by trainee on 10/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class Dictcell: UITableViewCell {

    @IBOutlet weak var dictlbl: UILabel!
    @IBOutlet weak var dictlbl1: UILabel!
    @IBOutlet weak var dictlbl2: UILabel!
    @IBOutlet weak var dictlbl3: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
