//
//  MainCollectionAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 29..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class MainCollectionAdapter: NSObject, CollectionViewDelegate, ScrollDelegate {
    var collectionView : UICollectionView!
    
    var collectionController : CollectionViewControllerManager!
    var fetchController : CollectionFetchControllerManager!
    
    
    func initzialize() {
        self.collectionController.scrollDelegate = self;
    }
    
    //MARK : -
    func configureCell(cell: UICollectionViewCell, item: AnyObject) {

    }
    
    func didSelectItem(item: AnyObject) {
        
    }
    func didDeselectItem(item: AnyObject) {
        
    }
    //MARK: -
    //MARK: TableViewDelegate
    //MARK: -
    func didSelectRow(item: AnyObject) {
        
    }
    func didDeselectRow(item: AnyObject) {
        
    }
    func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) {
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {

    }
    
}
