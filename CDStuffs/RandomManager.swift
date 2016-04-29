//
//  RandomManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData
class RandomManager: BackgroundContext {
    
    var data : NSMutableArray = NSMutableArray();
    var timer : NSTimer?
    
    var randomString : String?
    
    func addRandomData() {
        self.privateContext.performBlock({
            self.prepareData()
        })
    }
    
    func addIndexedRandomData(str : String?) {
        self.privateContext.performBlock { 
            self.randomString = str;
            self.prepareData()
        }
    }
    
    private func prepareData() {
        for index in 0...10 {
            let str : String = "\(self.randomString) Random Task \(index)"
            self.insertData(str)
        }
    }
    
    private func insertData(str : String) {
            let entity =  NSEntityDescription.entityForName("Task",
                inManagedObjectContext: self.privateContext)
            let person = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext: self.privateContext) as! Task
            person.name = str
            self.save()

        
    }
    
}
