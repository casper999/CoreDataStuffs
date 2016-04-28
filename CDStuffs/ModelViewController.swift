//
//  ModelViewController.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var adapter : ModelAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = ModelAdapter()
        adapter.tableView = tableView
        adapter.initzialize()

        // Do any additional setup after loading the view.
//        let manager = ModelManager()
//        manager.addModel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
