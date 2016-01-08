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

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "Sentences"
        
        
	}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let termString = TermString()
        let batches = termString.getBatch(type: .Same, amount: 2)
        print(batches)
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