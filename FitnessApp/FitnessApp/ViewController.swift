//
//  ViewController.swift
//  FitnessApp
//
//  Created by trainee on 26/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
  
    @IBOutlet weak var dataTableView: UITableView!
    
    @IBOutlet weak var imgBackground: UIImageView!
    override func viewDidLoad() {

        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.imgBackground.image = UIImage(named: "Fitness")
        
    
        Alamofire.request("https://jsonplaceholder.typicode.com/todos/1").responseJSON { (responseData) -> Void in
            
            if (responseData.result.value != nil){
                //let dataDict =
            }
            
            
          //  switch responseData.result {
                
                
                
                
//            case .success(let json):
//                print(json)
//                DispatchQueue.main.async {
//
//                    // handle your code
//
//                }
//            case .failure(let error):
//                print(error)
//            }
        }
   
    


}

}
