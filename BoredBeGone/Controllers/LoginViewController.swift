//
//  ViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/25/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var BottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BottomView.addBorder(side: .Top, thickness: 1, color: UIColor.lightGray)
        navigationItem.title = "Log In"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destinationView = segue.destination as? forgotUsernameOrPasswordViewController {
            if segue.identifier == "forgotUsername" {
                destinationView.navigationItem.title = "Forgot Username"
            } else if segue.identifier == "forgotPassword" {
                destinationView.navigationItem.title = "Forgot Password"
            }
        }
    }
    
    @IBAction func unwindToLoginPage(segue: UIStoryboardSegue) {
        
    }
    
}

