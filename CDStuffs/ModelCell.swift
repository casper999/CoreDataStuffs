//
//  ModelCell.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 26..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ModelCell: UITableViewCell {

    var model : Model?
    
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var ratingText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
    
    func configureCell(item : Model) {
        model = item
        self.nameText?.text = model?.name
        self.ratingText.text = "\(model?.rating?.intValue)"
        self.pictureView?.image = nil
        if (model?.image != nil) {
            let image = UIImage(data: model?.image as! NSData)
            self.pictureView?.image = image
        } else {
            self.downloadImage()
        }
//        downloadImage()
//        print("model -> \(model)")
    }
    
   
    
    
    private func downloadImage() {
        let imgURL = NSURL(string: (model?.imageURL)!)
        
        let request: NSURLRequest = NSURLRequest(URL: imgURL!)
        
        print(model?.imageURL)
        
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
            }
        })

        
        
    }
    
}
