//
//  AddStoreListViewController.swift
//  GroceryAppSwift
//
//  Created by rem{e}koh on 10/24/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

protocol AddStoreListViewControllerDelegate: class {
    
    func addStoreListViewControllerDidAddStore(store: Store)
    
}

class AddStoreListViewController: UIViewController  {
    
    weak var delegate: AddStoreListViewControllerDelegate!
    
    @IBOutlet weak var addStoreNameTextField: UITextField!
    @IBOutlet weak var addStoreNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
    
    }
    
    @IBAction func addStoreButtonPressed(_ sender: AnyObject) {
        
        let newStore = Store()
        
        newStore.storeName = self.addStoreNameTextField.text!
        newStore.storeNumber = self.addStoreNumberTextField.text!
        newStore.color = UIColor.lightGray
        newStore.groceryItems = [Any]()
        
        self.delegate.addStoreListViewControllerDidAddStore(store: newStore)
        
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
