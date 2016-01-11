//
//  ViewController.swift
//  P2
//
//  Created by 文川术 on 1/5/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

	var labels = [UILabel]()
	var dots = [UIView]()
    var buttons = [UIButton]()
    
    let customView = CustomView()


	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationItem.title = "Characters"
        self.view.backgroundColor = UIColor.backgroundColor()
        
		let letters = ["迟", "吃", "chi", "刺", "痴", "ci", "chi"]
		getLabels(letters)
		getDots()
        
        let buttonSize = CGSize(width: view.frame.height * 0.2, height: view.frame.height * 0.2)
        let titles = ["Same", "Different"]
        
        for i in 0..<2 {
            let x = (self.view.frame.width / 4 - buttonSize.width / 2) + ((self.view.frame.width / 2) * CGFloat(i))
            
            let rect = CGRectMake(x, 200, buttonSize.width, buttonSize.height)
            
            let button = customView.mainScreenButton(titles[i], color: UIColor.redColor(), frame: rect)
            buttons.append(button!)
            view.addSubview(button!)
        }


	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        
        
        for button in buttons {
            button.hidden = false
        }
        
        for i in 0..<buttons.count {
            self.buttons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
        }


		UIView.animateWithDuration(1.0) { () -> Void in
			self.dots[0].frame.origin.x = 65 / 2 + self.labels[0].frame.origin.x
			self.dots[0].frame.size.width = 65
			self.dots[0].backgroundColor = UIColor.redColor()
			self.dots[0].layer.cornerRadius = 2

			self.dots[1].frame.origin.y = self.labels[4].frame.origin.y + 30
			self.dots[1].frame.size.height = 60
			self.dots[1].backgroundColor = UIColor.redColor()
			self.dots[1].layer.cornerRadius = 2
		}

	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

		let x = self.view.frame.width / 4
		let y: CGFloat = 125

		dots[0].backgroundColor = UIColor.clearColor()
		dots[1].backgroundColor = UIColor.clearColor()

		dots[0].frame = CGRectMake(x, y - 1.5, 0, 3)
		dots[1].frame = CGRectMake(x * 3 - 1.5, y, 3, 0)
	}

	func getDots() {
		let x = self.view.frame.width / 4
		let y: CGFloat = 125

		let dot_0 = UIView(frame: CGRectMake(x, y - 1.5, 0, 3))
		dot_0.backgroundColor = UIColor.clearColor()
		dots.append(dot_0)

		let dot_1 = UIView(frame: CGRectMake(x * 3 - 1.5, y, 3, 0))
		dot_0.backgroundColor = UIColor.clearColor()
		dots.append(dot_1)

		for dot in dots {
			dot.backgroundColor = UIColor.clearColor()
			self.view.addSubview(dot)
		}

	}

	func getLabels(letters: [String]) {

		let quarter = self.view.frame.width / 4
		let y: CGFloat = 65
		let width: CGFloat = 65
		let height: CGFloat = 60

		let label_0 = UILabel(frame: CGRectMake(quarter - width, y, width, height))
		labels.append(label_0)

		let label_1 = UILabel(frame: CGRectMake(quarter, y, width, height))
		labels.append(label_1)

		let label_2 = UILabel(frame: CGRectMake(quarter - width, y + height, width * 2, height))
		labels.append(label_2)

		let label_3 = UILabel(frame: CGRectMake(quarter * 3 - width, y, width, height))
		labels.append(label_3)

		let label_4 = UILabel(frame: CGRectMake(quarter * 3, y, width, height))
		labels.append(label_4)

		let label_5 = UILabel(frame: CGRectMake(quarter * 3 - width, y + height, width, height))
		labels.append(label_5)

		let label_6 = UILabel(frame: CGRectMake(quarter * 3, y + height, width, height))
		labels.append(label_6)

		for i in 0..<labels.count {
			labels[i].text = letters[i]
			labels[i].textAlignment = .Center
			labels[i].font = UIFont.boldSystemFontOfSize(20)
			self.view.addSubview(labels[i])
		}

		labels[2].textColor = UIColor.redColor()
		labels[5].textColor = UIColor.redColor()
		labels[6].textColor = UIColor.redColor()
	}


}

