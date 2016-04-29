//
//  ModelCollectionCell.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var model : Model?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cofigureCell(item : Model) {
        self.model = item;
        self.imageView.image = nil
        self.textLabel.text = nil
        self.textLabel?.text = self.model?.rating?.stringValue
        if (model?.image != nil) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                // do some task
                let image = UIImage(data: self.model?.image as! NSData)
                //
                dispatch_async(dispatch_get_main_queue(), {
                    // update some UI
                    self.imageView?.image = image
                });
            });
            
            
        } else {
            self.downloadImage()
        }
//        print("name -> \(model?.name)")
        drawDesing()

    }

    private func drawDesing() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
        
    }
    private func downloadImage() {
        let imgURL = NSURL(string: (model?.imageURL)!)
        let request: NSURLRequest = NSURLRequest(URL: imgURL!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                // Convert the downloaded data in to a UIImage object
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    if (data != nil) {
                        let manager : ModelManager = ModelManager()
                        manager.saveImage(data!, andItem: self.model!)
                    } else {
                        print("not download image")
                    }
                })
            }
            else {
                print("Error: \(error!.localizedDescription)")
                print("Error url: \(self.model?.imageURL)")
            }
        })
        
        
        
    }
}
