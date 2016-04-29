//
//  TaskManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData
class TaskManager: BackgroundContext {
    
    
    func addData(str : String) {
        self.privateContext.performBlock { 
            let entity =  NSEntityDescription.entityForName("Task",
                inManagedObjectContext: self.privateContext)
            let person = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext: self.privateContext) as! Task
            person.name = str
            self.save();
            print("block save");
        }
    }
    
    func deleteData(item : Task) {
        self.privateContext.performBlock {
            self.context.deleteObject(item)
            self.save()
        }
    }
    func deleteAllData() {
        self.privateContext.performBlock {
            let fetchRequest = NSFetchRequest(entityName: "Task")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            deleteRequest.resultType = .ResultTypeCount

            do {
                let batchDeleteResult =  try self.context.persistentStoreCoordinator!.executeRequest(deleteRequest, withContext: self.context)
                print("The batch delete request has deleted \(batchDeleteResult.result!) records.")
            } catch let error as NSError {
                // TODO: handle the error
                print("Could not save private \(error), \(error.userInfo)")

            }
        }
    }
    
    func removeAllData() {
        self.privateContext.performBlock {
            let entity =  NSEntityDescription.entityForName("Task",
                inManagedObjectContext: self.context)
            let fetchRequest = NSFetchRequest()
            fetchRequest.entity = entity
//            fetchRequest.fetchBatchSize = 50
            do {
                let fetchResults = try self.context.executeFetchRequest(fetchRequest)
                if let managedObjects = fetchResults as? [NSManagedObject] {
                    for object in managedObjects {
                        self.context.deleteObject(object)
                        
                    }
                }
            } catch let error as NSError {
                print("Could not save private \(error), \(error.userInfo)")
            }
        }
        
    }
}
