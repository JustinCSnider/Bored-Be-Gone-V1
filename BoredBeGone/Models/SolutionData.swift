//
//  SolutionData.swift
//  BoredBeGone
//
//  Created by Justin Snider on 11/8/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation

enum filter {
    case athletic
}

var activeFilters: [filter] = []

private var firstPartAnswerList: [String : [filter]] = ["Run" : [.athletic],
                                                "Eat" : [],
                                                "Drive" : []]

var validFirstPartAnswerList: [String] = ["Run",
                                          "Eat",
                                          "Drive"]

private var secondPartAnswerList: [String] = [" with some friends",
                                              " by your self",
                                              " somewhere new"]

var validSecondPartAnswerList: [String] = [" with some friends",
                                           " by your self",
                                           " somewhere new"]

func validateAnswerLists() {
    // CHECKS FOR WHAT VALUES NEED TO BE REMOVED AND ADDED IN "validFirstPartAnswerList"
    // REMOVES
    // Runs through every pair in firstPartAnswerList
    for i in firstPartAnswerList {
        var needsMissingKey = true
        // Runs through every filter in the activeFilters array
        for j in activeFilters {
            // Checks if the current firstPartAnswerList filter array contains the current activeFilters filter
            if i.value.contains(j) && validFirstPartAnswerList.lastIndex(of: i.key) != nil{
                validFirstPartAnswerList.remove(at: validFirstPartAnswerList.lastIndex(of: i.key)!)
            }
        }
        // ADDS
        // Runs through every filter in the current firstPartAnswerList array
        for j in i.value {
            // Checks if any
            if activeFilters.contains(j) {
                needsMissingKey = false
            }
        }
        if needsMissingKey == true && validFirstPartAnswerList.lastIndex(of: i.key) == nil {
            validFirstPartAnswerList.append(i.key)
        }
    }
}
