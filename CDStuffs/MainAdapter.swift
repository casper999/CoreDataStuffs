//
//  MainAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class MainAdapter: NSObject, TableViewDelegate {
    var tableView : UITableView!
    var tableController : TableViewControllerManager!
    var fetchController : FetchControllerManager!
    //MARK: -
    //MARK: Initzialize
    //MARK: -
    func initzialize() {
//        //FetchControllerManager init
//        fetchController = FetchControllerManager()
//        fetchController.tableView = tableView
//        fetchController.entityName = "Task"
//        
//        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        fetchController.sortDescriptors = [sortDescriptor]
//        //TableViewControllerManager init
//        tableController = TableViewControllerManager()
//        tableController.tableView = tableView
//        tableController.fetchController = fetchController
//        //
//        tableController.initzialize()
        
    }
    //MARK: -
    //MARK: TableViewDelegate
    //MARK: -
    func didSelectRow(item: AnyObject) {
        
    }
    func didDeselectRow(item: AnyObject) {
        
    }
    func configureCell(cell: UITableViewCell, item: AnyObject) {
        
    }
    func commitEditingStyle(editingStyle: UITableViewCellEditingStyle, indexPath: NSIndexPath) {
        
    }
    
    
}
