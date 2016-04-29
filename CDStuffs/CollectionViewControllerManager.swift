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
//@objc protocol ScrollDelegate {
//    optional func scrollViewDidScroll(scrollView: UIScrollView)
//}
class CollectionViewControllerManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    var collectionView : UICollectionView!
    
    var fetchController : CollectionFetchControllerManager!
    
    var cellIdentifier : String!
    
    var delegate : CollectionViewDelegate?
    var scrollDelegate : ScrollDelegate?
    
    func initzialize() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.fetchController.initzialize()
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width : CGFloat = collectionView.frame.size.width / 2 - 10
        let height : CGFloat = collectionView.frame.size.height / 2
        
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
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//            // do some task
//
//            dispatch_async(dispatch_get_main_queue(), {
//                // update some UI
//                
//
//                });
//            });
        let item : AnyObject = self.fetchController.fetchedResultsController.objectAtIndexPath(indexPath)

        self.delegate?.configureCell(cell, item: item);
        return cell;
        
    }
    
    //MARK : -
    //MARK : ScrollView Delegete
    //MARK : -
    @objc func scrollViewDidScroll(scrollView: UIScrollView) {
        self.scrollDelegate?.scrollViewDidScroll!(scrollView)
    }
    
    
    
}
