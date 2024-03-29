//
//  HomeViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/26/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var solutionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subView.layer.borderWidth = 2
        subView.layer.borderColor = UIColor.lightGray.cgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func solveBoredomTapped(_ sender: UIButton) {
        let firstPartIndex = Int.random(in: 0 ..< validFirstPartAnswerList.count)
        let secondPartIndex = Int.random(in: 0 ..< validSecondPartAnswerList.count)
        
        solutionLabel.text = validFirstPartAnswerList[firstPartIndex] + validSecondPartAnswerList[secondPartIndex]
    }
    
    
    @IBAction func unwindToHomePage(segue: UIStoryboardSegue) {
        
    }
}
