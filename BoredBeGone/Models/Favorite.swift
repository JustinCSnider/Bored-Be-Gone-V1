//
//  Favorite.swift
//  BoredBeGone
//
//  Created by Justin Snider on 11/12/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation
import CoreData

class Favorite: NSManagedObject {
    @NSManaged var solution: String
    
    @NSManaged var toAccount: Account
    
    static var entityName: String {return "Favorite"}
}
