//
//  BackgroundContext.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData
class BackgroundContext: NSObject {
    
    lazy var context : NSManagedObjectContext = {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var managedObjectContext = appDelegate.managedObjectContext
        return managedObjectContext
    }()
    
    lazy var privateContext : NSManagedObjectContext = {
        var ctx : NSManagedObjectContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
//        context.persistentStoreCoordinator = self.context.persistentStoreCoordinator
        ctx.parentContext = self.context
        return ctx
        
    }()
    
    lazy var persistentStoreCoordinator : NSPersistentStoreCoordinator = {
        return self.context.persistentStoreCoordinator!
    }()
    
    
    func save() {
        do {
            try privateContext.save()
            
            print("save private data")
            do {
                try context.save()
                print("save context")
            } catch let error as NSError {
                print("Could not save context \(error), \(error.userInfo)")
            }
            
            
        } catch let error as NSError  {
            print("Could not save private \(error), \(error.userInfo)")
        }
    }    
}
