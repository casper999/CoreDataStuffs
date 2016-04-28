//
//  TaskAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class TaskAdapter: MainAdapter {

    override func initzialize() {
        //FetchControllerManager
        fetchController = FetchControllerManager()
        fetchController.tableView = tableView
        fetchController.entityName = "Task"
        //
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchController.sortDescriptors = [sortDescriptor]
        //TableViewControllerManager
        tableController = TableViewControllerManager()
        tableController.tableView = tableView
        tableController.fetchController = fetchController
        tableController.delegate = self
        tableController.cellIdentifier = "tableCell"
        //
        tableController.initzialize()
    }
    //MARK: -
    //MARK: TableViewDelegate
    //MARK: -
    override func configureCell(cell: UITableViewCell, item: AnyObject) {
        let task = item as! Task
        cell.textLabel?.text = task.name
    }
    
    override func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let manager : TaskManager = TaskManager()
            let item : Task = fetchController.fetchedResultsController.objectAtIndexPath(indexPath) as! Task
            manager.deleteData(item)
        }
    }
    
}
