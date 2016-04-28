//
//  FetchControllerManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData

class FetchControllerManager: NSObject, NSFetchedResultsControllerDelegate {
    
    var tableView : UITableView!
    
    var entityName : String!
    var sectionName : String?
    var cacheName : String?
    
    
    var sortDescriptors : NSArray?
    
    var predicate : NSPredicate?
    
    
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        var context = appDelegate.managedObjectContext
        return context
    }()
    
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest(entityName: self.entityName)
        //Add SortDescriptor
        fetchRequest.sortDescriptors = self.sortDescriptors as? [NSSortDescriptor]
        //Add Predicate
        fetchRequest.predicate = self.predicate
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: self.sectionName, cacheName: self.cacheName)
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    func initzialize() {
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
    }

    
    

    //MARK: -
    //MARK: FetchedResultController
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch (type) {
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Automatic);
            break
        case .Insert:
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Automatic);
            break
        case .Move:
            if(!indexPath!.isEqual(newIndexPath!)) {
                tableView.moveRowAtIndexPath(indexPath!, toIndexPath: newIndexPath!);
            }
            break
        case .Delete:
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Automatic)
            break
        }
        
    }
    
    
    
}
