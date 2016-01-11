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
        
//		let letters = ["迟", "吃", "chi", "刺", "痴", "ci", "chi"]
//		getLabels(letters)
//		getDots()
		let button_y: CGFloat = 32
		let distance_vertical = (view.frame.width / 2) * 0.866
        let buttonSize = CGSize(width: view.frame.height * 0.18, height: view.frame.height * 0.18)
        let titles = ["Same?!", "Split it", "Type it"]
		let positions = [CGPoint(x: (view.frame.width - buttonSize.width) / 2, y: button_y), CGPoint(x: view.frame.width / 4 - buttonSize.width / 2, y: button_y + distance_vertical), CGPoint(x: view.frame.width * 3 / 4 - buttonSize.width / 2, y: button_y + distance_vertical)]
        
        for i in 0..<3 {

            let rect = CGRectMake(positions[i].x, positions[i].y, buttonSize.width, buttonSize.height)
            let button = customView.mainScreenButton(titles[i], color: UIColor.lightGreen(), frame: rect)
			button?.addTarget(self, action: "selected:", forControlEvents: .TouchUpInside)
            buttons.append(button!)
            view.addSubview(button!)
        }

		let rect = CGRectMake(view.frame.width / 2 - 35, view.frame.height - 85 - 64, 70, 70)
		let recordButton = customView.mainScreenButton("Record", color: UIColor.whiteColor(), frame: rect)
		recordButton?.backgroundColor = UIColor.lightGreen()
		recordButton?.layer.shadowColor = UIColor.deepGreen().CGColor
		recordButton?.addTarget(self, action: "selected:", forControlEvents: .TouchUpInside)
		buttons.append(recordButton!)
		view.addSubview(recordButton!)


	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
        
        
        for button in buttons {
            button.hidden = false
        }

		buttons[0].genAnimation(.Appear, delay: 0.0, distance: 30)
		buttons[1].genAnimation(.Appear, delay: 0.1, distance: 70)
		buttons[2].genAnimation(.Appear, delay: 0.1, distance: 70)
		buttons[3].genAnimation(.Appear, delay: 0.2, distance: 110)

//        for i in 0..<buttons.count {
//            self.buttons[i].genAnimation(.Appear, delay: 0.1 * Double(i), distance: 30 + CGFloat(i) * 40.0)
//        }


//		UIView.animateWithDuration(1.0) { () -> Void in
//			self.dots[0].frame.origin.x = 65 / 2 + self.labels[0].frame.origin.x
//			self.dots[0].frame.size.width = 65
//			self.dots[0].backgroundColor = UIColor.redColor()
//			self.dots[0].layer.cornerRadius = 2
//
//			self.dots[1].frame.origin.y = self.labels[4].frame.origin.y + 30
//			self.dots[1].frame.size.height = 60
//			self.dots[1].backgroundColor = UIColor.redColor()
//			self.dots[1].layer.cornerRadius = 2
//		}

	}

	func selected(sender: UIButton) {
		for view in self.view.subviews {
			if let button = view as? UIButton {
				if button == sender {
					button.genAnimation(.Touched, delay: 0.0, distance: 0.0)
				} else {
					button.genAnimation(.Disappear, delay: 0.0, distance: 0.0)
				}
			}
		}

		delay(seconds: 1.0) { () -> () in
			let VC = WViewController()
			self.navigationController?.pushViewController(VC, animated: true)
		}

	}

	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)

//		let x = self.view.frame.width / 4
//		let y: CGFloat = 125
//
//		dots[0].backgroundColor = UIColor.clearColor()
//		dots[1].backgroundColor = UIColor.clearColor()
//
//		dots[0].frame = CGRectMake(x, y - 1.5, 0, 3)
//		dots[1].frame = CGRectMake(x * 3 - 1.5, y, 3, 0)
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

