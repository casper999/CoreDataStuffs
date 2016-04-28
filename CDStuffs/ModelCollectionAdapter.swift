//
//  ModelCollectionAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCollectionAdapter: NSObject, CollectionViewDelegate {
    var collectionView : UICollectionView!
    
    var collectionController : CollectionViewControllerManager!
    var fetchController : CollectionFetchControllerManager!
    
    func initzialize() {
        
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
        collectionController .initzialize()
        
    }
    
    func configureCell(cell: UICollectionViewCell, item: AnyObject) {
        let modelCell : ModelCollectionCell = cell as! ModelCollectionCell
        let model : Model = item as! Model
        modelCell.cofigureCell(model)
    }
    
    func didSelectItem(item: AnyObject) {
        
    }
    func didDeselectItem(item: AnyObject) {
        
    }
    
    
}
