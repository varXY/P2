//
//  TabBarController.swift
//  P2
//
//  Created by 文川术 on 1/5/16.
//  Copyright © 2016 xiaoyao. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

	override func viewDidLoad() {
		super.viewDidLoad()

		self.selectedIndex = 1
		self.delegate = self
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)

		if let navi = self.selectedViewController as? UINavigationController {
			navi.navigationBar.tintColor = UIColor.whiteColor()
			navi.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
			navi.navigationBar.barTintColor = UIColor.blueColor()
		}
	}



}

extension TabBarController: UITabBarControllerDelegate {

	func tabBarController(tabBarController: UITabBarController, willBeginCustomizingViewControllers viewControllers: [UIViewController]) {
		print(__FUNCTION__)
	}

	func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
		if let navi = viewController as? UINavigationController {
			navi.navigationBar.tintColor = UIColor.whiteColor()
			navi.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

			switch self.selectedIndex {
			case 0:
				navi.navigationBar.barTintColor = UIColor.redColor()
				navi.navigationItem.title = "Characters"
			case 1:
				navi.navigationBar.barTintColor = UIColor.blueColor()
				navi.navigationItem.title = "Words"
			case 2:
				navi.navigationBar.barTintColor = UIColor.greenColor()
				navi.navigationItem.title = "Sentences"
			default:
				break
			}
		}
	}
}