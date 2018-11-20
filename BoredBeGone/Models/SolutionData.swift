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
            // Checks if activeFilters contains any filters inside firstPartAnswerList and sets needsMissingKey equal to false if their is.
            if activeFilters.contains(j) {
                needsMissingKey = false
            }
        }
        // Adds any missing string on to validFirstPartAnswerList if needsMissingKey is equal to true and validFirstPartAnswerList doesn't already have that string
        if needsMissingKey == true && validFirstPartAnswerList.lastIndex(of: i.key) == nil {
            validFirstPartAnswerList.append(i.key)
        }
    }
    
    // CHECKS FOR WHAT VALUES NEED TO BE REMOVED IN "validSecondPartAnswerList"
    // REMOVES
    // Runs through every string in secondPartAnswerList
    for i in secondPartAnswerList {
        // Used to see if their is any duplicates in the list
        var answerCount = 0
        // Runs through every string in validSecondPartAnswerList
        for j in validSecondPartAnswerList {
            // Checks if validSecondPartAnswerList has any values that match with the current value in secondPartAnswerList and adds to answer count if their is.
            if i == j {
                answerCount += 1
                // Deletes any duplicates in validSecondPartAnswerList
                while answerCount > 1 {
                    if validSecondPartAnswerList.lastIndex(of: i) != nil {
                        validSecondPartAnswerList.remove(at: validSecondPartAnswerList.lastIndex(of: i)!)
                        answerCount -= 1
                    } else {
                        answerCount = 1
                        return
                    }
                }
            }
        }
    }
}
