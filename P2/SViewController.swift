//
//  SViewController.swift
//  P2
//
//  Created by 文川术 on 1/5/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class SViewController: UIViewController {
    
    var buttons = [UIButton]()
    
    let customView = CustomView()


	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationItem.title = "Sentences"
        self.view.backgroundColor = UIColor.backgroundColor()
        
        let buttonSize = CGSize(width: view.frame.height * 0.2, height: view.frame.height * 0.2)
        let titles = ["Same", "Different"]
        
        for i in 0..<2 {
            let x = (self.view.frame.width / 4 - buttonSize.width / 2) + ((self.view.frame.width / 2) * CGFloat(i))
            let y = (self.view.frame.height - 64 - 49 - buttonSize.height) / 2 - 30 + (60 * CGFloat(i))
            
            let rect = CGRectMake(x, y, buttonSize.width, buttonSize.height)
            
            let button = customView.mainScreenButton(titles[i], color: UIColor.greenColor(), frame: rect)
            buttons.append(button!)
            view.addSubview(button!)
        }
	}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let termString = TermString()
        let batches = termString.getCollection(type: .Same, amount: 2)
        print(batches)
        
        for button in buttons {
            button.hidden = false
        }
        
        for i in 0..<buttons.count {
            self.buttons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
        }
    }

	func getLabels(letters: [String]) {

		for i in 0..<8 {
			let y = i < 4 ? 10 + 50 * i : 235 + 50 * (i - 4)
			let label = UILabel(frame: CGRectMake(0, CGFloat(y), self.view.frame.width, 50))
			label.text = letters[i]
			label.textAlignment = .Center
		}
	}
}