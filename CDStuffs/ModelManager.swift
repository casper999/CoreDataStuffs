//
//  ModelManager.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit
import CoreData

class ModelManager: BackgroundContext {
    
    var data : NSMutableArray?
    
    var models : NSArray = ["Rachel", "Stephanie", "Sarah", "Josephine", "Alex", "Jessica", "Rhonda", "Alice", "Sam", "Victoria"]
    var images : NSArray = ["http://2.bp.blogspot.com/-01HgZRiT_1g/UeRfeduSFkI/AAAAAAAAB3M/Iw1nUKY2f6I/s1600/New+beautiful+25+pictures+of+the+world%2527s+most+beautiful+girls++%25E2%2580%25AB%25281%2529%25E2%2580%25AC+%25E2%2580%25AB%25E2%2580%25AC.jpg",
                            "http://up.n4hr.com/uploads/1412654481052.png",
                            "https://pbs.twimg.com/profile_images/662586729317036032/GzPCSAty.jpg",
                            "https://pbs.twimg.com/profile_images/484177494317088770/qd0Ao9iZ.jpeg",
                            "http://photos.motogp.com/2014/09/28/paddock-girls__gp_3472_crop_crop_4_3_1424954011.photos_4_3_cropped_bigger.jpg",
                            "http://www.braindirector.com/wp-content/uploads/2015/10/understanding-female-attraction.jpg",
                            "https://pixabay.com/static/uploads/photo/2015/09/04/19/51/girl-922621_960_720.jpg",
                            "http://cdn2.cagepotato.com/wp-content/uploads/2014/08/jennifer-nguyen-photos-sexy-ufc-ring-girl-01.jpg",
                            "http://www.vectraline.hu/FALINAPTAR_HOT_GIRLS-i150812.jpg",
                            "http://www.vectraline.hu/FALINAPTAR_HOT_GIRLS-i150788.jpg"]
    
    
    func addModel() {
        self.prepareData()
        self.privateContext.performBlock {
            for item in self.data! {
                let entity =  NSEntityDescription.entityForName("Model",
                    inManagedObjectContext: self.privateContext)
                let model = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: self.privateContext) as! Model
                model.name = item.objectForKey("name") as? String
                model.imageURL = item.objectForKey("imageURL") as? String
                model.rating = item.objectForKey("rating") as? NSNumber
            }
            self.save()
        }
    }
    
    func deleteData(item : Model) {
        self.context.deleteObject(item)
        self.save()
    }
    
    
    func prepareData() {
        data = NSMutableArray()
        var idx : Int = 0;
        for model in models {
            let dict = NSMutableDictionary()
            dict.setValue(model, forKey: "name")
            let imageURL = images.objectAtIndex(idx)
            print("imageURL \(imageURL) \(idx)")
            dict.setValue(imageURL, forKey: "imageURL")
            let rating = getRandomRation()
            dict.setValue(rating, forKey: "rating")
            data?.addObject(dict)
            idx += 1
        }
        
    }
    
    
    private func getRandomRation() -> NSNumber {
        var randomNumber = arc4random_uniform(40) + 10
        print(randomNumber)
        
        let lower : UInt32 = 1
        let upper : UInt32 = 10
        randomNumber = arc4random_uniform(upper - lower) + lower
        print(randomNumber)
        let number : NSNumber = NSNumber(unsignedInt: randomNumber)
        
        return number
    }
    
    func saveImage(imageData : NSData, andItem item : Model) {
        item.image = imageData
        self.save()
    }
}
