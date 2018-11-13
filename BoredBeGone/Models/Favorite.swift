//
//  Favorite.swift
//  BoredBeGone
//
//  Created by Justin Snider on 11/12/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation
import CoreData

class Favorite: NSManagedObjectContext {
    @NSManaged var solution: String
    
    @NSManaged var toAccount: Account
}
