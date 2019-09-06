//
//  DataBaseHelper.swift
//  CoreDataTest
//
//  Created by trainee on 20/08/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper{
    static var sharInstance = DataBaseHelper()
   
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object:[String: String]){
      let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.name = object["name"]
        user.address = object["address"]
        user.city = object["city"]
        user.mobile = object["mobile"]
        
        do
        {
            try context?.save()
        }
        catch
        {
            print("data in not saved")
        }
        print("inserted")
    }
    
    func getData() -> [User]{
        var user = [User]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        do
        {
            user = try context?.fetch(fetchRequest) as! [User]
        }
        catch
        {
            print("can't get data")
        }
     return user
    }
    
    func deleteData(index:Int) -> [User] {
        var user = getData()
        context?.delete(user[index])
        user.remove(at: index)
        
        do
        {
            try context?.save()
        }
        catch
        {
            print("cannot delete data")
        }
        print("data is delete")
        return user
    }
    
    func editData(object:[String:String], i:Int) {
        var user = getData()
        user[i].name = object["name"]
        user[i].address = object["address"]
        user[i].city = object["city"]
        user[i].mobile = object["mobile"]
        do
        {
            try context?.save()
        }
        catch
        {
            print("data is not edit")
        }
        
    }
}
