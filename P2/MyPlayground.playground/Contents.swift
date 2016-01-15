//: Playground - noun: a place where people can play

import UIKit


let resourceName = NSBundle.mainBundle().pathForResource("词语", ofType: "txt")

var dictionaryText = NSString()
try! dictionaryText = NSString(contentsOfFile: resourceName!, encoding: NSUTF8StringEncoding)

