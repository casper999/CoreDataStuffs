//
//  ScrollDelegate.swift
//  CDStuffs
//
//  Created by Kővári Armand on 2016. 04. 29..
//  Copyright © 2016. Canecom. All rights reserved.
//

import Foundation
@objc protocol ScrollDelegate {
    optional func scrollViewDidScroll(scrollView: UIScrollView)
}