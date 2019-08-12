//
//  ViewController.swift
//  Notificationapp
//
//  Created by trainee on 23/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    
    override func viewDidLoad() {
        // Configure User Notification Center
       
        super.viewDidLoad()
       
        
        let center = UNUserNotificationCenter.current()
        
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge])
        { (granted, error) in

        }
        
       
    }

    @IBAction func btnSendLocalNotification(_ sender: Any) {
        
        let content = UNMutableNotificationContent()
        content.title = "Local Notification"
        content.body = "Look at me"
        content.badge = 1
       
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "timeDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
      
        }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([
            .alert, .sound, .badge
            ])
    }
       
}
    
    

