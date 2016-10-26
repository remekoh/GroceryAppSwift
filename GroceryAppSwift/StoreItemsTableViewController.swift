//
//  StoreItemsTableViewController.swift
//  GroceryAppSwift
//
//  Created by rem{e}koh on 10/24/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class StoreItemsTableViewController: UITableViewController,AddGroceryListItemViewControllerDelegate {
    
    var groceryItems : [GroceryItem]!
    
    
    var selectedStore : Store!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.title = self.selectedStore.storeName
        
        self.groceryItems = [GroceryItem]()
        
        
        self.title = "\(self.selectedStore.storeName) : \(self.selectedStore.storeNumber)"
        
        self.view.backgroundColor = self.selectedStore.color
    }
    
    func addGroceryListItemViewControllerDidAddItem(groceryItem: GroceryItem) {
        
        self.selectedStore.groceryItems.append(groceryItem)
        self.tableView.reloadData()
   
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

        return self.selectedStore.groceryItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addItemListVC = segue.destination as? AddItemsListViewController
        addItemListVC?.delegate = self
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath)
        
        var groceryItem = GroceryItem()
        
        groceryItem = self.selectedStore.groceryItems[(indexPath.row)] as! GroceryItem;
        
        cell.textLabel?.text = groceryItem.itemName
        

        return cell
    }

}
