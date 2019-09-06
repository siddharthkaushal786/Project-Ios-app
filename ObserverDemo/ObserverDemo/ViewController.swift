//
//  ViewController.swift
//  ObserverDemo
//
//  Created by trainee on 19/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var imgSocial: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(facebook(notification:)), name: .facebook, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(twitter(notification:)), name: .twitter, object: nil)
        
    }
    
    
    @objc func facebook(notification: Notification){
        lblStatus.text = "Facebook"
        imgSocial.image = #imageLiteral(resourceName: "facebook")
        }
    
    @objc func twitter(notification: Notification){
        lblStatus.text = "Twitter"
        imgSocial.image = #imageLiteral(resourceName: "Twitter")
        }
    
    
    @IBAction func btnSelectSocial(_ sender: Any) {
        
        let Secondvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(Secondvc, animated: true)
    }
    

}

extension Notification.Name{
    static let facebook = Notification.Name("Facebook")
    static let twitter = Notification.Name("Twitter")
}

