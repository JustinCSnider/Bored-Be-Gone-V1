//
//  NewAccountViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/26/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class NewAccountViewController: UIViewController {

    @IBOutlet var BottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BottomView.addBorder(side: .Top, thickness: 1, color: UIColor.lightGray)
        navigationItem.title = "New Account"
        // Do any additional setup after loading the view.
    }
    

}
