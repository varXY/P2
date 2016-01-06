//
//  NavigationViewController.swift
//  P2
//
//  Created by 文川术 on 1/5/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {


	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
		self.navigationBar.tintColor = UIColor.whiteColor()
		self.navigationBar.translucent = false

	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

}