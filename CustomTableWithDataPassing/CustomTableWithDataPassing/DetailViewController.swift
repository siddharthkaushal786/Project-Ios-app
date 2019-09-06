//
//  DetailViewController.swift
//  CustomTableWithDataPassing
//
//  Created by trainee on 13/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblData: UILabel!
    
    var imgStr : UIImage?
    var lblDataStr : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgDetail.image = imgStr
        lblData.text = lblDataStr
    }


}
