//
//  ModelCollectionViewController.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    let adapter : ModelCollectionAdapter = ModelCollectionAdapter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("hmmm collection view");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // do some task
            //
            self.adapter.collectionView = self.collectionView

            dispatch_async(dispatch_get_main_queue(), {
                // update some UI
                self.adapter.initzialize()
            });
        });
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
