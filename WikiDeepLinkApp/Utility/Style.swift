//
//  Style.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

struct Style {
  
	struct NavigationController {
		static func edit(_ navigationController: UINavigationController) {
			let titleColor = UITraitCollection.current.userInterfaceStyle == .dark ? Colors.white : Colors.black
			
			navigationController.navigationBar.tintColor = Colors.black
			navigationController.navigationBar.barTintColor = Colors.white
			navigationController.navigationBar.isTranslucent = true
			navigationController.navigationBar.titleTextAttributes = [
				.foregroundColor: titleColor,
				.font: Fonts.large
			]
		}
	}
}

