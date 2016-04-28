//
//  TableViewControllerManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
@objc protocol TableViewDelegate {
    func configureCell(cell:UITableViewCell, item : AnyObject) -> Void
    func didSelectRow(item : AnyObject) -> Void
    func didDeselectRow(item : AnyObject) -> Void
    func commitEditingStyle(editingStyle : UITableViewCellEditingStyle, indexPath: NSIndexPath)
}


class TableViewControllerManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    var tableView : UITableView!
    var fetchController : FetchControllerManager!
    
    var cellIdentifier : String!
    
    var delegate : TableViewDelegate?
    
    var rowHeight : NSNumber?
    
    // MARK: -
    // MARK: Initzialize
    func initzialize() {
        tableView.delegate = self
        tableView.dataSource = self
        fetchController.initzialize()
        //
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(reloadTableView),name: "reloadTableView",object: nil)
    }
    //MARK: -
    //MARK: Reload notifications
    func reloadTableView() {
        tableView.reloadData()
    }
    // MARK: -
    //MARK: Tableview Delegate, DataSource
    //MARK:
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (self.rowHeight != nil) {
            let height = self.rowHeight?.floatValue
            return CGFloat(height!)
        }
        return 44
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.commitEditingStyle(editingStyle, indexPath: indexPath)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = fetchController.fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = fetchController.fetchedResultsController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)
        let item : AnyObject = fetchController.fetchedResultsController.objectAtIndexPath(indexPath)
        delegate?.configureCell(cell, item: item)
        return cell;
    }
    //
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item : AnyObject = fetchController.fetchedResultsController.objectAtIndexPath(indexPath)
        delegate?.didSelectRow(item)
        
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let item : AnyObject = fetchController.fetchedResultsController.objectAtIndexPath(indexPath)
        delegate?.didDeselectRow(item)
    }
    
    
    
}
