//
//  TxtToPlist.swift
//  P2
//
//  Created by Bobo on 1/21/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


class TxtToPlist {
    
    var terms = [[String]]()
    
    init() {
        let resourceName = NSBundle.mainBundle().pathForResource("词语", ofType: "txt")
        var dictionaryText: NSString = ""

        try! dictionaryText = NSString(contentsOfFile: resourceName!, encoding: NSUnicodeStringEncoding) as NSString
        let dictionaryArray = dictionaryText.componentsSeparatedByString("\r\n")
        
        for i in 0..<dictionaryArray.count - 1 {
            var term = [String]()
            
            let sparated = dictionaryArray[i].componentsSeparatedByString("\t")
            term.append(sparated[0])
            
            let pinyin = sparated[1].componentsSeparatedByString("\'")
            for yin in pinyin {
                term.append(yin)
            }
            
            terms.append(term)
            print(terms[i])
            
        }
    }
    
    func documentDiretory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        print(paths[0])
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return "\(documentDiretory())/terms.plist"
    }
    
    func saveRecords() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(terms, forKey: "terms")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadRecords() {
        let path = NSBundle.mainBundle().pathForResource("terms", ofType: "plist")
        
        if NSFileManager.defaultManager().fileExistsAtPath(path!) {
            
            if let data = NSData(contentsOfFile: path!) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                terms = unarchiver.decodeObjectForKey("terms") as! [[String]]
                unarchiver.finishDecoding()
            }
            
        }
        
    }

}