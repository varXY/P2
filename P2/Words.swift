//
//  Words.swift
//  P2
//
//  Created by Bobo on 1/7/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


typealias batch = [String]


struct Words {
    
    let same = "a，啊，阿。ai，爱，挨。ai，唉，矮。ao，熬，袄。"
    let different = "a，ai，啊，唉。an，ang，俺，昂。an，ang，按，肮。"
    
    func getBatch() -> batch {
        let groups = same.componentsSeparatedByString("。")
        
        var batch = [String]()
        for group in groups {
            batch = group.componentsSeparatedByString("，")
        }
        
        return batch
    }
}