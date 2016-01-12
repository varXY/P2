//
//  NSArray+randomOrder.swift
//  P2
//
//  Created by Bobo on 1/12/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


extension NSArray {
    
    func randomOrder() -> NSArray {
        
        let sorted = self.sort { (_, _) -> Bool in
            arc4random() < arc4random()
        }
        
        return sorted
    }
}