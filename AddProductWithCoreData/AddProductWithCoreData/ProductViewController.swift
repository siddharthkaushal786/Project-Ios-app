//
//  ProductViewController.swift
//  AddProductWithCoreData
//
//  Created by trainee on 17/09/19.
//  Copyright © 2019 trainee. All rights reserved.
//

import UIKit
import CoreData

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tblVwProduct: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var productArr = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
       getData()
        tblVwProduct.reloadData()
    }
   
    @IBAction func btnAddProductClick(_ sender: Any) {
        let addProductVc = self.storyboard?.instantiateViewController(withIdentifier: "AddProductViewController") as! AddProductViewController
        self.navigationController?.pushViewController(addProductVc, animated: true)
    }
    
    func getData(){
        do {
            productArr = try context.fetch(Product.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
    }
//   func getData() -> Int {
//
//
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Product")
//    fetchRequest.propertiesToFetch = ["id"]
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]
//
//        do {
//
//           productArr = try context.fetch(Product.fetchRequest())
//            let lastObject = (productArr as [NSManagedObject]).last
//
//            guard lastObject != nil else {
//                return 1
//            }
//
//            return lastObject?.value(forKey: "id") as! Int + 1
//
//        }
//        catch {
//            print("error")
//            //handle error
//        }
//
//        return 1
//    }

    
}
extension ProductViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwProduct.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
       cell.item =  productArr[indexPath.row]
       return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
            let index = productArr[indexPath.row]
            context.delete(index)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                productArr = try context.fetch(Product.fetchRequest())
                
            }
            catch {
                print("cannot delete")
            }
            print("Data is delete")
         
        }
        tblVwProduct.reloadData()
    }
}

