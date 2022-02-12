//
//  Extenstion+UIWindow.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 08/02/2022.
//

import UIKit

extension UIWindow {
	func updateRootViewController(with viewController: UIViewController) {
		UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
			self.rootViewController = viewController
		}, completion: nil)
	}
}


