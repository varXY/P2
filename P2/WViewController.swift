//
//  WViewController.swift
//  P2
//
//  Created by 文川术 on 1/5/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class WViewController: UIViewController {

	var labels = [UILabel]()
	var dots = [UIView]()
    var buttons = [UIButton]()
    
    let customView = CustomView()
    var term: Term?
    var allTerms = [[String]]()
    
    var startTime = NSTimeInterval()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationItem.title = "Words"
        self.view.backgroundColor = UIColor.backgroundColor()
//        self.term = Term()
//        let string: NSString = "重"
//        let arr = string.toPinyinArray()
//        print(arr)
//        
//        let string_1: NSString = "什么"
//        let arr_1 = string_1.toPinyinArrayWithSeparator(" ")
//        print(arr_1)
//        
//        let string_2: NSString = "重阳"
//        let arr_2 = string_2.toPinyinArrayWithSeparator(" ")
//        print(arr_2)
//        
//        let String_arr = ["睡觉", "觉得"] as NSArray
//        let arr_3 = String_arr.searchPinYinWithKeyPath(nil, searchString: "de")
//        print(arr_3)
        
        
//        let txtToPlist = TxtToPlist()
//        txtToPlist.saveRecords()
        
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            self.allTerms = self.getTerms()
            dispatch_async(dispatch_get_main_queue()) {
                self.view.backgroundColor = UIColor.purpleColor()
                self.printThing()
            }
        }
        
        
//        let currentTime = NSDate.timeIntervalSinceReferenceDate()
//        var elapsedTime: NSTimeInterval = currentTime - startTime
//        
//        let minutes = UInt32(elapsedTime / 60.0)
//        
//        elapsedTime -= (NSTimeInterval(minutes) * 60)
//        
//        //calculate the seconds in elapsed time.
//        
//        let seconds = UInt8(elapsedTime)
//        
//        elapsedTime -= NSTimeInterval(seconds)
//        
//        //find out the fraction of milliseconds to be displayed.
//        
//        let fraction = UInt8(elapsedTime * 100)
//        
//        //add the leading zero for minutes, seconds and millseconds and store them as string constants
//        
//        let strMinutes = String(format: "%02d", minutes)
//        let strSeconds = String(format: "%02d", seconds)
//        let strFraction = String(format: "%02d", fraction)
//        
//        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
//        
//        print("\(strMinutes):\(strSeconds):\(strFraction)")
        
        
	}
    
    func printThing() {
        let numbers = getRandomNumbers(100, lessThan: 5000)
        for number in numbers {
            print(allTerms[number])
        }
    }
    
    func getTerms() -> [[String]] {
        var terms = [[String]]()
        let path = NSBundle.mainBundle().pathForResource("terms", ofType: "plist")
        
        if NSFileManager.defaultManager().fileExistsAtPath(path!) {
            
            if let data = NSData(contentsOfFile: path!) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                terms = unarchiver.decodeObjectForKey("terms") as! [[String]]
                unarchiver.finishDecoding()
            }
            
        }
        
        return terms
        
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        
        
        

//        let indexes = getRandomNumbers(10, lessThan: 5000)
//        for index in indexes {
//            print(index)
//            let word = term?.getTerm(index)
//            print(word)
//        }
        
//        Next stap: create plist file to store these words
//        let pinyin = term?.getPinYin("你好")
//        print(pinyin)

	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

	}

	func getDots() {
		let x = self.view.frame.width / 4
		let y_0: CGFloat = labels[0].frame.origin.y + labels[0].frame.height
		let y_1: CGFloat = labels[3].frame.origin.y + labels[3].frame.height

		let dot_0 = UIView(frame: CGRectMake(x, y_0 - 1.5, 0, 3))
		dot_0.backgroundColor = UIColor.clearColor()
		dots.append(dot_0)

		let dot_1 = UIView(frame: CGRectMake(x * 3 - 1.5, y_1, 3, 0))
		dot_0.backgroundColor = UIColor.clearColor()
		dots.append(dot_1)

		for dot in dots {
			dot.backgroundColor = UIColor.clearColor()
			self.view.addSubview(dot)
		}

	}

	func getLabels(letters: [String]) {

		let quarter = self.view.frame.width / 4
		let y_0: CGFloat = 40
		let y_1: CGFloat = self.view.frame.height - 40 - 120 - 49 - 64
		let width: CGFloat = 70
		let height: CGFloat = 60

		let label_0 = UILabel(frame: CGRectMake(quarter - width, y_0, width, height))
		labels.append(label_0)

		let label_1 = UILabel(frame: CGRectMake(quarter, y_0, width, height))
		labels.append(label_1)

		let label_2 = UILabel(frame: CGRectMake(quarter - width, y_0 + height, width * 2, height))
		labels.append(label_2)

		let label_3 = UILabel(frame: CGRectMake(quarter * 3 - width, y_1, width, height))
		labels.append(label_3)

		let label_4 = UILabel(frame: CGRectMake(quarter * 3, y_1, width, height))
		labels.append(label_4)

		let label_5 = UILabel(frame: CGRectMake(quarter * 3 - width, y_1 + height, width, height))
		labels.append(label_5)

		let label_6 = UILabel(frame: CGRectMake(quarter * 3, y_1 + height, width, height))
		labels.append(label_6)

		for i in 0..<labels.count {
			labels[i].text = letters[i]
			labels[i].textAlignment = .Center
			labels[i].font = UIFont.boldSystemFontOfSize(16)
			self.view.addSubview(labels[i])
		}

		labels[2].textColor = UIColor.blueColor()
		labels[5].textColor = UIColor.blueColor()
		labels[6].textColor = UIColor.blueColor()
	}
}