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
//            person.setValue(str, forKey: "name")
            person.name = str
            
            self.save();
            print("block save");
        }
//        print("not perform block")
        
        
    }
    
    func deleteData(item : Task) {
        self.context.deleteObject(item)
        self.save()
    }
    func deleteAllData() {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        // Initialize Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        // Configure Batch Update Request
        batchDeleteRequest.resultType = .ResultTypeCount
        do {
            // Execute Batch Request
            let batchDeleteResult = try context.executeRequest(batchDeleteRequest) as! NSBatchDeleteResult
            
            print("The batch delete request has deleted \(batchDeleteResult.result!) records.")
            
            // Reset Managed Object Context
            context.reset()
            let notification = NSNotification(name: "reloadTableView", object: nil, userInfo: nil)
            NSNotificationCenter.defaultCenter().postNotification(notification)
        } catch {
            let updateError = error as NSError
            print("\(updateError), \(updateError.userInfo)")
        }
        
            
    }
    
    private func removeAllData() {
        let entity =  NSEntityDescription.entityForName("Task",
                                                        inManagedObjectContext: self.privateContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entity
        fetchRequest.fetchBatchSize = 50
//        let fetchResults = self.privateContext.executeFetchRequest(fetchRequest, error: &error)
//        if error.memory != nil {
//            return
//        }
        do {
            let fetchResults = try self.privateContext.executeFetchRequest(fetchRequest)
            if let managedObjects = fetchResults as? [NSManagedObject] {
                for object in managedObjects {
                    self.privateContext.deleteObject(object)
                }
                self.save()
            }
            
        } catch let error as NSError {
            print("Could not save private \(error), \(error.userInfo)")
        }
    }
}
