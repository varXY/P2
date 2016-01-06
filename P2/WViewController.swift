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

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.title = "Words"

		let letters = ["赐予", "词语", "ci yu", "认识", "仍是", "ren shi", "reng shi" ]
		getLabels(letters)
		getDots()
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)


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
		let y_0: CGFloat = labels[0].frame.origin.y + labels[0].frame.height
		let y_1: CGFloat = labels[3].frame.origin.y + labels[3].frame.height

		dots[0].backgroundColor = UIColor.clearColor()
		dots[1].backgroundColor = UIColor.clearColor()

		dots[0].frame = CGRectMake(x, y_0 - 1.5, 0, 3)
		dots[1].frame = CGRectMake(x * 3 - 1.5, y_1, 3, 0)
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

		labels[2].textColor = UIColor.redColor()
		labels[5].textColor = UIColor.redColor()
		labels[6].textColor = UIColor.redColor()
	}
}