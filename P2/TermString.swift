//
//  Words.swift
//  P2
//
//  Created by Bobo on 1/7/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


struct TermString {
    
    let string_same = "a，啊，阿。ai，爱，挨。ai，唉，矮。ao，熬，袄。ang，肮，盎。"
    let string_different = "a，ai，啊，唉。an，ang，俺，昂。an，ang，按，肮。"
    
    func getCollection(type type: DuadType, amount: Int) -> [Collection]? {
        
        switch type {
        case .Same:
            var groups = string_same.componentsSeparatedByString("。")
            groups.removeLast()

            let numbers = getRandomNumbers(amount, lessThan: groups.count)
            
            var filtedGroups = [Group]()
            for i in numbers {
                filtedGroups.append(groups[i])
            }
            
            var collections = [Collection]()
            for group in filtedGroups {
                let batch = group.componentsSeparatedByString("，")
                collections.append(batch)
            }
            return collections
            
        case .Different:
            return nil
        }
    }
}