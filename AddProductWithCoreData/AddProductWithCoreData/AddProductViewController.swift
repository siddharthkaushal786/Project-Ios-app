//
//  ProductDetailViewController.swift
//  AddProductWithCoreData
//
//  Created by trainee on 17/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CoreData

class AddProductViewController: UIViewController {
    @IBOutlet weak var txtFldProductId: UITextField!
    @IBOutlet weak var txtFldProductname: UITextField!
    @IBOutlet weak var txtFldProductPrice: UITextField!
    @IBOutlet weak var txtFldProductDetail: UITextField!
  
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func btnAddProductClick(_ sender: Any) {
        AddProduct()
        self.navigationController?.popViewController(animated: true)
    }
    
    func AddProduct() {
        if txtFldProductId.text == "" || txtFldProductname.text == "" || txtFldProductDetail.text == "" || txtFldProductPrice.text == ""
        {
           displayMessage(message: "Please don't blank the fields")
            
        } else {
        
        let productUser = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
           
        productUser.setValue(txtFldProductId.text, forKey: "id")
        productUser.setValue(txtFldProductname.text, forKey: "name")
        productUser.setValue(txtFldProductDetail.text, forKey: "detail")
        productUser.setValue(txtFldProductPrice.text, forKey: "price")
            print(productUser)
        
        do
        {
            try context.save()
            print("Inserted Value")
           // self.navigationController?.popViewController(animated: true)
        }
        catch
        {
            let Fetcherror = error as NSError
            print("error", Fetcherror.localizedDescription)
        }
        
    }
    }
    
    
    func displayMessage(message : String){
        let alert = UIAlertController(title: "Alert", message: "Please don't blank the fields", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
}
