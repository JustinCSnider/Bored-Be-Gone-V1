//
//  IntroToLoginViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/25/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class IntroToLoginViewController: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.addBorder(side: .Top, thickness: 1, color: UIColor.lightGray)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
