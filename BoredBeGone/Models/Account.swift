//
//  Account.swift
//  BoredBeGone
//
//  Created by Justin Snider on 11/12/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation
import CoreData

class Account: NSManagedObjectContext {
    @NSManaged var username: String
    @NSManaged var password: String
    @NSManaged var email: String
    
    @NSManaged var favorites: NSSet?
}
