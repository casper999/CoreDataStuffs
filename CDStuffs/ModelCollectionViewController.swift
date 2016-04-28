//
//  ModelCollectionViewController.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var adapter : ModelCollectionAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adapter = ModelCollectionAdapter()
        adapter.collectionView = self.collectionView
        adapter.initzialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addRandomModels(sender: AnyObject) {
        let manager = ModelManager()
        manager.addModel()
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
