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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
