//
//  ViewController.swift
//  FacebookIntegration
//
//  Created by trainee on 21/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKCoreKit
import FBSDKLoginKit
import Social
import FirebaseAuth

class ViewController: UIViewController{
    @IBOutlet weak var lblFacebook: UILabel!
    @IBOutlet weak var imgFacebook: UIImageView!
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
        getFacebookUserInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgFacebook.image = UIImage(named: "fb-art.jpg")
        view.addSubview(imgFacebook)
        
        lblFacebook.text = "Not Logged In"
        lblFacebook.textAlignment = NSTextAlignment.center
        view.addSubview(lblFacebook)
        
        // Create Facebook login Button
        let loginBtn = FBLoginButton()
        loginBtn.center = CGPoint(x: view.center.x, y: 400)
        self.view .addSubview(loginBtn)
        loginBtn.delegate = self
    }
  
    
    //Getting Facebook User Info
    func getFacebookUserInfo() {
        if(AccessToken.current != nil)
        {
            //print permissions, such as public_profile
           // print(AccessToken.current.permissions)
            let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields" : "id, name, email"])
            let connection = GraphRequestConnection()
            
            connection.add(graphRequest, completionHandler: { (connection, result, error) -> Void in
                
                let data = result as! [String : AnyObject]
                
                self.lblFacebook.text = data["name"] as? String
                
                let FBid = data["id"] as? String
                
                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                self.imgFacebook.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
            })
            connection.start()
        }
    }
       
}

extension ViewController: LoginButtonDelegate{
    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        print("will Log In")
        Profile.enableUpdatesOnAccessTokenChange(true)
        NotificationCenter.default.addObserver(self, selector: #selector(onProfileUpdated(notification:)), name:NSNotification.Name.ProfileDidChange, object: nil)
        return true
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        } else {
            
            let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
            
        // ...
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if error != nil {
                    // ...
                    return
                }
                self.getFacebookUserInfo()
                // User is signed in
              print("Complete Login")
            }

    }
       
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("Log Out")
            imgFacebook.image = UIImage(named: "fb-art.jpg")
            lblFacebook.text = "Not Logged In"
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
       
    }
    @objc func onProfileUpdated(notification: NSNotification)
    {
        print("profile updated")
        print("\(String(describing: Profile.current?.userID))")
        print("\(String(describing: Profile.current?.firstName!))")
    }
}
