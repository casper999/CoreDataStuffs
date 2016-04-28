//
//  ModelAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelAdapter: MainAdapter {

    override func initzialize() {
        
        tableView.registerNib(UINib(nibName: "ModelCell", bundle: nil), forCellReuseIdentifier: "modelCell")

        
        
        fetchController = FetchControllerManager()
        fetchController.tableView = tableView
        fetchController.entityName = "Model"
        //
        let nameDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        let rateDescriptor = NSSortDescriptor(key: "rating", ascending: false)
        fetchController.sortDescriptors = [nameDescriptor]
        //TableViewControllerManager
        tableController = TableViewControllerManager()
        tableController.tableView = tableView
        tableController.fetchController = fetchController
        tableController.delegate = self
        tableController.cellIdentifier = "modelCell"
        tableController.rowHeight = NSNumber(int: 100)
        //
        tableController.initzialize()
        
    }
    
    override func configureCell(cell: UITableViewCell, item: AnyObject) {
        let model : Model = item as! Model
        let modelCell : ModelCell = cell as! ModelCell
        modelCell.configureCell(model)
//        cell.textLabel?.text = model.name
        
    }
    override func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let manager : ModelManager = ModelManager()
            let item : Model = fetchController.fetchedResultsController.objectAtIndexPath(indexPath) as! Model
            manager.deleteData(item)
        }
    }
    
}
