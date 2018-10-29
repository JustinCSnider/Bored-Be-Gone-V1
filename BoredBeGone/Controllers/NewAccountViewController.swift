//
//  NewAccountViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/26/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class NewAccountViewController: UIViewController {

    @IBOutlet var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addBorder(side: .Top, thickness: 1, color: UIColor.lightGray)
        // Do any additional setup after loading the view.
    }
    

}
