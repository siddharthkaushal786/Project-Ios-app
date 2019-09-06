//
//  ProfileViewController.swift
//  MenuApp
//
//  Created by trainee on 07/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnFollow: UIButton!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var imgFacebook: UIImageView!
    @IBOutlet weak var imgTwitter: UIImageView!
    @IBOutlet weak var imgLinkdin: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dropShadow()
        setImage()
        buttonFollowShadow()
        buttonMessageShadow()
        setFacebookImage()
        setTwitterImage()
        setLinkdinImage()
        }
   
    @IBAction func btnProfile(_ sender: Any) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
//    self.navigationController?.popToRootViewController(animated: true)
    
    }
    
    //Set View Corner and Shadow
    func dropShadow(scale: Bool = true) {
        // set the shadow of the view's layer
        viewProfile.layer.masksToBounds = false
        viewProfile.layer.cornerRadius = 10
        viewProfile.backgroundColor = UIColor(red: 95/255, green: 126/255, blue: 148/255, alpha: 1.0)
        viewProfile.layer.shadowColor = UIColor.green.cgColor
        viewProfile.layer.shadowOpacity = 0.6
        viewProfile.layer.shadowOffset = .zero
        viewProfile.layer.shadowRadius = 15.0
        viewProfile.layer.shadowPath = UIBezierPath(rect: viewProfile.bounds).cgPath
        viewProfile.layer.shouldRasterize = true
        viewProfile.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
    //Set user profiler corner
    func setImage(){
       //imgProfile.layer.borderWidth = 1.0
        imgProfile.layer.masksToBounds = true
       //imgProfile.layer.borderColor = UIColor.white.cgColor
       imgProfile.layer.cornerRadius = imgProfile.frame.size.height / 2
//        imgProfile.clipsToBounds = true
    }
    
    // Set Facebook Image corner
    func setFacebookImage(){
        //imgFacebook.layer.borderWidth = 1.0
        imgFacebook.layer.masksToBounds = true
        //imgFacebook.layer.borderColor = UIColor.white.cgColor
        imgFacebook.layer.cornerRadius = imgProfile.frame.size.height / 2
        
    }
    
    // Set Twitter Image corner
    func setTwitterImage(){
        //imgTwitter.layer.borderWidth = 1.0
        imgTwitter.layer.masksToBounds = true
       // imgTwitter.layer.borderColor = UIColor.white.cgColor
        imgTwitter.layer.cornerRadius = imgTwitter.frame.size.height / 2
        
        
    }
    
    // Set Linkdin Image coner
    func setLinkdinImage(){
       // imgLinkdin.layer.borderWidth = 1.0
        imgLinkdin.layer.masksToBounds = true
        //imgLinkdin.layer.borderColor = UIColor.white.cgColor
        imgLinkdin.layer.cornerRadius = imgLinkdin.frame.size.height / 2
        
        
    }
    
    // Set Button Follow Corner and Radius
    func buttonFollowShadow(scale: Bool = true){
        btnFollow.layer.masksToBounds = false
        btnFollow.layer.cornerRadius = 10
        //btnFollow.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnFollow.layer.shadowColor = UIColor.blue.cgColor
        btnFollow.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnFollow.layer.shadowRadius = 15.0
        btnFollow.layer.shouldRasterize = true
        btnFollow.layer.shadowOpacity = 0.6
        btnFollow.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
    //Set Button Message
    func buttonMessageShadow(scale: Bool = true){
       btnMessage.layer.masksToBounds = false
        btnMessage.layer.cornerRadius = 10
        //btnFollow.backgroundColor = UIColor(red: 227/255, green: 123/255, blue: 63/255, alpha: 1.0)
        btnMessage.layer.shadowColor = UIColor.blue.cgColor
        btnMessage.layer.shadowOffset = CGSize(width: 2, height: 2)
        btnMessage.layer.shadowRadius = 15.0
        btnMessage.layer.shouldRasterize = true
        btnMessage.layer.shadowOpacity = 0.6
        btnMessage.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
}
