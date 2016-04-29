//
//  ModelCollectionAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCollectionAdapter: MainCollectionAdapter {
//    var collectionView : UICollectionView!
    
//    var collectionController : CollectionViewControllerManager!
//    var fetchController : CollectionFetchControllerManager!
    
    override func initzialize() {
        
//        tableView.registerNib(UINib(nibName: "ModelCell", bundle: nil), forCellReuseIdentifier: "modelCell")
        self.collectionView.registerNib(UINib(nibName:"ModelCollectionCell", bundle: nil ), forCellWithReuseIdentifier: "modelCollCell")
        fetchController = CollectionFetchControllerManager()
        fetchController.collectionView = collectionView
        fetchController.entityName = "Model"
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchController.sortDescriptors = [sortDescriptor]
        collectionController = CollectionViewControllerManager()
        collectionController.collectionView = collectionView
        collectionController.fetchController = fetchController
        collectionController.cellIdentifier = "modelCollCell"
        collectionController.delegate = self
        super.initzialize()
        collectionController .initzialize()
        
    }
    
    override func configureCell(cell: UICollectionViewCell, item: AnyObject) {
        let modelCell : ModelCollectionCell = cell as! ModelCollectionCell
        let model : Model = item as! Model
        modelCell.cofigureCell(model)
    }
    
    override func didSelectItem(item: AnyObject) {
        
    }
    override func didDeselectItem(item: AnyObject) {
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                // do some task
                dispatch_async(dispatch_get_main_queue()) {
                    let manager = ModelManager()
                    manager.addModel()
                }
            }
            
        }
    }
    
    
}
