//
//  CollectionFetchControllerManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData

class CollectionFetchControllerManager: FetchControllerManager {
    var collectionView : UICollectionView!
    
//    var blockOperation : NSBlockOperation?
    
    var shouldReloadCollectionView : Bool? = false
    
    
    //MARK: -
    //MARK: FetchedResultController
    override func controllerWillChangeContent(controller: NSFetchedResultsController) {
        shouldReloadCollectionView = false;
        self.blockOperation = NSBlockOperation()
    }
    
    override func controllerDidChangeContent(controller: NSFetchedResultsController) {
        if (self.shouldReloadCollectionView == true) {
            self.collectionView.reloadData()
        } else {
            self.collectionView.performBatchUpdates({
                self.blockOperation?.start()
                }, completion: nil)
        }
    }
    
    //MARK: changeObject
    override func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch (type) {
        case .Update:
            self.blockOperation?.addExecutionBlock({
                self.collectionView.reloadItemsAtIndexPaths([indexPath!])
            })
            break
        case .Insert:
            if (self.collectionView.numberOfSections() > 0) {
                if (indexPath != nil) {
                    if (self.collectionView.numberOfItemsInSection((indexPath?.section)!) == 0) {
                        self.shouldReloadCollectionView = true
                    } else {
                        self.blockOperation?.addExecutionBlock({
                            self.collectionView.insertItemsAtIndexPaths([newIndexPath!])
                        })
                    }
                } else {
                    self.shouldReloadCollectionView = true
                }
            } else {
                self.shouldReloadCollectionView = true
            }
            break
        case .Move:
            self.blockOperation?.addExecutionBlock({ 
                self.collectionView.moveItemAtIndexPath(indexPath!, toIndexPath: newIndexPath!)
            })
            break
        case .Delete:
            self.blockOperation?.addExecutionBlock({
                self.collectionView.deleteItemsAtIndexPaths([indexPath!])
            })
            break
        }
        
    }
    //MARK: chagen Sections
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch (type) {
        case .Insert:
            self.blockOperation?.addExecutionBlock({ 
                self.collectionView.insertSections(NSIndexSet(index: sectionIndex))
            })
            
            break
        case .Delete:
            self.blockOperation?.addExecutionBlock({ 
                self.collectionView.deleteSections(NSIndexSet(index: sectionIndex))
            })
            
            break
            
        case .Update:
            self.blockOperation?.addExecutionBlock({ 
                self.collectionView.reloadSections(NSIndexSet(index: sectionIndex))
            })
            break
            
        case .Move:
            //Todo
            break
            
        
        }
        
    }
}
