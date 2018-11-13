//
//  CoreDataStack.swift
//  BoredBeGone
//
//  Created by Justin Snider on 11/12/18.
//  Copyright © 2018 Justin Snider. All rights reserved.
//

import Foundation
import CoreData

func createManagedObjectContext(completion: @escaping (NSPersistentContainer) -> Void){
    
    let container = NSPersistentContainer(name: "Favorites")
    
    // Happens asynchronously
    container.loadPersistentStores { (persistentStoreDescription, error) in
        
        guard error == nil else {fatalError("Something went wrong.")}
        
        DispatchQueue.main.async {
            completion(container)
        }
    }
    
}

protocol ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext! { get set }
}
