//
//  FiltersViewController.swift
//  BoredBeGone
//
//  Created by Justin Snider on 10/25/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //========================================
    //MARK: - Switch actions
    //========================================
    
    @IBAction func withFriendsSwitch(_ sender: UISwitch) {
        changingStringAvailability(for: " with some friends", with: sender)
    }
    
    @IBAction func athleticSwitch(_ sender: UISwitch) {
        changingFilterState(ofType: .athletic, with: sender)
    }
    
    //========================================
    //MARK: -  Private functions
    //========================================
    
    private func changingFilterState(ofType filter: filter, with currentSwitch: UISwitch ) {
        // Adds the filter on to the active filters dictionary if the switch is on and removes the filter when the switch is on
        if currentSwitch.isOn && activeFilters.lastIndex(of: filter) == nil {
            activeFilters.append(filter)
        } else if !currentSwitch.isOn && activeFilters.lastIndex(of: filter) != nil {
            while activeFilters.lastIndex(of: filter) != nil {
                activeFilters.remove(at: activeFilters.lastIndex(of: filter)!)
            }
        }
    }
    
    private func changingStringAvailability(for secondPart: String, with currentSwitch: UISwitch) {
        if currentSwitch.isOn && validSecondPartAnswerList.lastIndex(of: secondPart) == nil {
            validSecondPartAnswerList.append(secondPart)
        } else if !currentSwitch.isOn && validSecondPartAnswerList.lastIndex(of: secondPart) != nil {
            while validSecondPartAnswerList.lastIndex(of: secondPart) != nil {
                validSecondPartAnswerList.remove(at: validSecondPartAnswerList.lastIndex(of: secondPart)!)
            }
        }
    }
}
