//
//  StoreTableViewController.swift
//  GroceryAppSwift
//
//  Created by rem{e}koh on 10/24/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit


class StoreTableViewController: UITableViewController,AddStoreListViewControllerDelegate {
   
    var stores : [Store]!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.stores = [Store]()
        
        let wholeFoods = Store()
        wholeFoods.storeName = "WHOLE FOODS"
        wholeFoods.storeNumber = "5300"
        wholeFoods.color = UIColor.brown
        wholeFoods.groceryItems = [Any]()
        
        self.stores.append(wholeFoods)
        
        let heb = Store()
        heb.storeName = "HEB"
        heb.storeNumber = "7500"
        heb.color = UIColor.orange
        heb.groceryItems = [Any]()
        
        self.stores.append(heb)
        
        let aldi = Store()
        aldi.storeName = "ALDI"
        aldi.storeNumber = "5000"
        aldi.color = UIColor.brown
        aldi.groceryItems = [Any]()
        
        self.stores.append(aldi)
        
        let walmart = Store()
        walmart.storeName = "ALDI"
        walmart.storeNumber = "3500"
        walmart.color = UIColor.orange
        walmart.groceryItems = [Any]()
        
        self.stores.append(walmart)
        
        let kroger = Store()
        kroger.storeName = "KROGER"
        kroger.storeNumber = "7000"
        kroger.color = UIColor.brown
        kroger.groceryItems = [Any]()
        
        self.stores.append(kroger)
        
    }
    
    func addStoreListViewControllerDidAddStore(store: Store) {
        
        self.stores.append(store)
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showStoreItems" {
           
            let indexPath = self.tableView.indexPathForSelectedRow
            
           let store = self.stores[(indexPath?.row)!]
            
            let storeItemsTableVC = segue.destination as? StoreItemsTableViewController
            storeItemsTableVC?.selectedStore = store
            
        } else {
            let addNewStoreListVC = segue.destination as? AddStoreListViewController
            addNewStoreListVC?.delegate = self
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.stores.count
    
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath)

        let store = self.stores[indexPath.row]
        cell.textLabel?.text = store.storeName
        cell.textLabel?.textColor = UIColor .white
        cell.detailTextLabel?.text = store.storeNumber
        cell.detailTextLabel?.textColor = UIColor .lightText
        cell.backgroundColor = store.color

        return cell
    }

}
