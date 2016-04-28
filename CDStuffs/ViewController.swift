//
//  ViewController.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var taskAdapter : MainAdapter!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskAdapter = TaskAdapter()
        taskAdapter.tableView = tableView
        taskAdapter.initzialize()
        // Do any additional setup after loading the view, typically from a nib.
        testApi()
    }
    
    func testApi() {
//        let api : ApiHandler = ApiHandler()
//        api.testDownload()
        
        let pussy : Pussy = Pussy()
        let string : String = pussy.getPussy()
        print("obj c ->" + string)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addData(sender: AnyObject) {
        
        
        let str = textField.text
        let manager : TaskManager = TaskManager()
        manager.addData(str!)
        
    }
    @IBAction func resetData(sender: AnyObject) {
        let manager : TaskManager = TaskManager()
        manager.deleteAllData()
    }
    
    @IBAction func addRandomData(sender: AnyObject) {
        let manager : RandomManager = RandomManager()
        manager.addRandomData()
    }
}

