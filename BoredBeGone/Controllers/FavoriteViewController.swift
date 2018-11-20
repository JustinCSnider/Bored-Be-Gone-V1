//
//  SavedViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/29/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ManagedObjectContextDependentType {
    
    //========================================
    //MARK: - Properties
    //========================================
    
    var managedObjectContext: NSManagedObjectContext!
    
    //========================================
    //MARK: - Life Cycle Methods
    //========================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Account.currentUser == nil {
            let alertController = UIAlertController(title: "Can't use this feature", message: "You need to be signed into an account to use this feature", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Log In", style: .default) { (alertAction) in
                self.performSegue(withIdentifier: "Create or sign in", sender: alertAction)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
                self.tabBarController?.selectedViewController = self.tabBarController?.viewControllers![0]
            }
            
            alertController.addAction(alertAction)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    //========================================
    //MARK: - TableViewDelegate methods
    //========================================
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        
        return cell
    }
    

}
