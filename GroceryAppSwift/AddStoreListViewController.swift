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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
