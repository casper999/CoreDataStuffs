//
//  MainAdapter.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class MainAdapter: NSObject, TableViewDelegate, UIScrollViewDelegate, ScrollDelegate {
    var tableView : UITableView!
    var tableController : TableViewControllerManager!
    var fetchController : FetchControllerManager!
    //MARK: -
    //MARK: Initzialize
    //MARK: -
    func initzialize() {
        tableController.scrollDelegate = self
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
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                // do some task
                dispatch_async(dispatch_get_main_queue()) {
                    // update some UI
                    let manager : RandomManager = RandomManager()
                    let str : String = "Pussy "
                    manager.addIndexedRandomData(str)
                }
            }
            
        }
    }
}
