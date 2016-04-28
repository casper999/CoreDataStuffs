//
//  Model+CoreDataProperties.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Model {

    @NSManaged var name: String?
    @NSManaged var rating: NSNumber?
    @NSManaged var image: NSObject?
    @NSManaged var imageURL: String?

}
