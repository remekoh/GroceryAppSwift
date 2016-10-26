//
//  AddItemsListViewController.swift
//  GroceryAppSwift
//
//  Created by rem{e}koh on 10/24/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

protocol AddGroceryListItemViewControllerDelegate: class {
    
    func addGroceryListItemViewControllerDidAddItem(groceryItem: GroceryItem)
    
}

class AddItemsListViewController: UIViewController {
    
    weak var delegate: AddGroceryListItemViewControllerDelegate!
    
    @IBOutlet weak var groceryItemTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   @IBAction func addGroceryItemButtonPressed(_ sender: AnyObject) {
    
        let groceryItem = GroceryItem()
    
        groceryItem.itemName = self.groceryItemTextField.text!
    
        self.delegate.addGroceryListItemViewControllerDidAddItem(groceryItem: groceryItem)
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
