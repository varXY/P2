//
//  Term.swift
//  P2
//
//  Created by Bobo on 1/20/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation


class Term {
    
    var dictionaryText: NSString!
    var termDic = [String: [String]]()
    
    init() {
        let resourceName = NSBundle.mainBundle().pathForResource("词语", ofType: "txt")
        try! dictionaryText = NSString(contentsOfFile: resourceName!, encoding: NSUnicodeStringEncoding) as NSString
        
        let dictionaryArray = dictionaryText.componentsSeparatedByString("\r\n")
        for i in 0..<dictionaryArray.count - 1 {
            let sparated = dictionaryArray[i].componentsSeparatedByString("\t")
            let pinyin = sparated[1].componentsSeparatedByString("\'")
            
            termDic[sparated[0]] = pinyin
        }

       
    }
    
    func getPinYin(string: String) -> [String] {
        return termDic[string]!
    }
    
    func getTerm(index: Int) -> [String] {
        var term = [String]()
        
        let dictionaryArray = dictionaryText.componentsSeparatedByString("\r\n")
        
        if index < dictionaryArray.count - 1 {
            let sparated = dictionaryArray[index].componentsSeparatedByString("\t")
            let pinyin = sparated[1].componentsSeparatedByString("\'")
            
            term.append(sparated[0])
            for yin in pinyin { term.append(yin) }
            
            return term
        } else {
            return term
        }
    }
    
    class func termAtIndex(index: Int) -> [String] {
        var term = [String]()
        
        let resourceName = NSBundle.mainBundle().pathForResource("词语", ofType: "txt")
        var dictionaryText = NSString()
        try! dictionaryText = NSString(contentsOfFile: resourceName!, encoding: NSUnicodeStringEncoding) as NSString
        let dictionaryArray = dictionaryText.componentsSeparatedByString("\r\n")
        
        if index < dictionaryArray.count - 1 {
            let sparated = dictionaryArray[index].componentsSeparatedByString("\t")
            let pinyin = sparated[1].componentsSeparatedByString("\'")
            
            term.append(sparated[0])
            for yin in pinyin { term.append(yin) }
            
            return term
        } else {
            return term
        }
        
        
    }
}