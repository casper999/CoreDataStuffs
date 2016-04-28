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
    
    
    
    func addRandomData() {
        self.privateContext.performBlock { 
            self.prepareData()
            self.save()
        }
        print("add random data")
    }
    
    
    private func prepareData() {
        for index in 0...1000 {
            let str : String = "Random data \(index)"
//            data.addObject(str)
            print("index: \(index)")
            self.insertData(str)
        }
        
    }
    
    private func insertData(str : String) {
            let entity =  NSEntityDescription.entityForName("Task",
                inManagedObjectContext: self.privateContext)
            let person = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext: self.privateContext) as! Task
//            person.setValue(str, forKey: "name")
            person.name = str
        
    }
    
}
