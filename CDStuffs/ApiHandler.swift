//
//  ApiHandler.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 27..
//  Copyright © 2016. Canecom. All rights reserved.
//

import UIKit

class ApiHandler: NSObject {
    
    var manager : AFHTTPSessionManager!
    
    override init() {
        super.init()
        manager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
    }
    
    
    
    func testDownload() {
        let uri : String = "http://www.mrnetradio.com/radiolist/radiosnew.json"
        self.manager.GET(uri, parameters: nil, success: { (task : NSURLSessionTask?, responseObject : AnyObject?) in
            //
            print("response -> \(responseObject)")
        }) { (operation :NSURLSessionDataTask?, error :NSError) in
                //
            print("error -> \(error.description)")
            
        }
    }
}
