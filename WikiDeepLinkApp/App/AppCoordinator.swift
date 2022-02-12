//
//  AppCoordinator.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 08/02/2022.
//

import UIKit

class AppCoordinator: Coordinator {
	// MARK: - Properties -
	let window: UIWindow
	
	
	// MARK: - Lifecycle -
	init(_ window: UIWindow) {
		self.window = window
		
	}
	
	// MARK: - Methods -
	func start() {
		//Show Main Screen
		showMain()
		
		// Finally make the window key and visible.
		window.makeKeyAndVisible()
	}
	
	/// Show Main Screen
	/// Method to show main Search screen
	/// - Parameter sender: window
	private func showMain() {
		let coordinator = TabBarCoordinator(window: window)
		coordinator.start()
	}
}
