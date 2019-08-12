//
//  ViewController.swift
//  EventKitapp
//
//  Created by trainee on 22/07/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import EventKitUI
class ViewController: UIViewController {
  
    let eventStore = EKEventStore()
    override func viewDidLoad() {
      
        eventStore.requestAccess(to: .event) {(success, err) in
            if success{
                print("Granted")
                //self.insertEvent(store: eventStore)
            }else{
                print("Not Granted")
            }
        }
        super.viewDidLoad()
    }
    
    @IBAction func btnAddEvent(_ sender: Any) {
       let event = EKEvent (eventStore: eventStore)
         event.title = "This is event"
        event.startDate = Date()
        event.endDate = Date()
        event.notes = "event notes"
        print(event.startDate)
        //event.calendar = eventStore.calendar(withIdentifier: self.calendar.calendarIdentifier)
        event.calendar = eventStore.defaultCalendarForNewEvents
        do{
            try eventStore.save(event, span: .thisEvent)
        }catch let error as NSError{
            print("error:\(error)")
        }
    
    }
   
    
}
