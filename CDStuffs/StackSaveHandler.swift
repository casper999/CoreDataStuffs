//
//  StackSaveHandler.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 29..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData
class StackSaveHandler: NSObject {
    static let sharedInstance = StackSaveHandler()
    
    let notificationCenter : NSNotificationCenter = NSNotificationCenter.defaultCenter()
    override init() {
        super.init()
        self.notificationCenter.addObserver(self, selector: #selector(managedObjectContextDidSave), name: NSManagedObjectContextDidSaveNotification, object: nil)
    }
    
    
    
    @objc func managedObjectContextDidSave(nofification : NSNotification) {
//        print("testing stacksave")
    }
}
