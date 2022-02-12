//
//  SearchCoordinator.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

protocol Routable: AnyObject {
	func openWikipediaApp(for url: URL)
}

class SearchCoordinator: Coordinator {
	var navigationController: UINavigationController
	
	
	// MARK: - Lifecycle -
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	
	// MARK: - Configure -
	func start() {
		guard let viewController = SearchViewController.build() else {return}
		viewController.delegate = self
		navigationController.setViewControllers([viewController], animated: false)
	}
}


extension SearchCoordinator: Routable {
	//Method to open Wikipedia app
	func openWikipediaApp(for url: URL) {
		UIApplication.shared.open(url, options: [:]) { _ in }
	}
}
