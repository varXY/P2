//
//  ActivityViewCustomActivity.swift
//  shareExtension
//
//  Created by Bobo on 1/15/16.
//  Copyright © 2016 mstcode. All rights reserved.
//

import Foundation
import UIKit

class ActivityViewCustomActivity: UIActivity {
    
    var customActivityType = ""
    var activityName = ""
    var activityImageName = ""
    var customActionWhenTapped:( (Void)-> Void)!
    
    init(title: String, imageName:String, performAction: (() -> ()) ) {
        self.activityName = title
        self.activityImageName = imageName
        self.customActivityType = "Action \(title)"
        self.customActionWhenTapped = performAction
        super.init()
    }
    
    override func activityType() -> String? {
        return customActivityType
    }
    
    override func activityTitle() -> String? {
        return activityName
    }
    
    override func activityImage() -> UIImage? {
        return UIImage(named: activityImageName)
    }
    
    override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
        return true
    }
    
    override func prepareWithActivityItems(activityItems: [AnyObject]) {
        // nothing to prepare
    }
    
    override func activityViewController() -> UIViewController? {
        return nil
    }
    
    override func performActivity() {
        customActionWhenTapped()
    }
}