//
//  CustomView.swift
//  P2
//
//  Created by Bobo on 1/9/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit


class CustomView {
    
    // MARK: - Main Screen Button
    
    func mainScreenButton(title: String, color: UIColor, frame: CGRect) -> UIButton? {
        let button = UIButton(type: .System)
        button.frame = CGRect(x: round(frame.origin.x), y: round(frame.origin.y), width: round(frame.size.width), height: round(frame.size.height))
        button.tintColor = color
        button.setTitle(title, forState: .Normal)
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
        button.backgroundColor = UIColor.whiteColor()
        button.layer.cornerRadius = frame.height / 2
        button.clipsToBounds = true
        
        genShadowForButton(button)
        
        return button
    }
    
    
    func genShadowForButton(button: UIButton) {
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.lightGrayColor().CGColor
        button.layer.shadowOffset = CGSizeMake(0, 0)
    }
}