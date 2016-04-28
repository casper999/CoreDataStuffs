//
//  CollectionViewControllerManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
@objc protocol CollectionViewDelegate {
    func configureCell(cell:UICollectionViewCell, item : AnyObject) -> Void
    func didSelectItem(item : AnyObject) -> Void
    func didDeselectItem(item : AnyObject) -> Void

}

class CollectionViewControllerManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    var collectionView : UICollectionView!
    
    var fetchController : CollectionFetchControllerManager!
    
    var cellIdentifier : String!
    
    var delegate : CollectionViewDelegate?
    
    
    func initzialize() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.fetchController.initzialize()
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width : CGFloat = collectionView.frame.size.width / 2 - 10
        let height : CGFloat = collectionView.frame.size.width / 2
        
        return CGSizeMake(width, height)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let sections = fetchController.fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if let sections = fetchController.fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        let item : AnyObject = fetchController.fetchedResultsController.objectAtIndexPath(indexPath)
        delegate?.configureCell(cell, item: item)
        return cell;
        
    }
    
    
    
}
