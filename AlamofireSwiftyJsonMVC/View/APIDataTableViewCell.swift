//
//  APIDataTableViewCell.swift
//  AlamofireSwiftyJsonMVC
//
//  Created by trainee on 08/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class APIDataTableViewCell: UITableViewCell {
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblIndex: UILabel!
    @IBOutlet weak var lblGuide: UILabel!
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblActive: UILabel!
    @IBOutlet weak var lblEyeColor: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var txtviewAbout: UITextView!
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
