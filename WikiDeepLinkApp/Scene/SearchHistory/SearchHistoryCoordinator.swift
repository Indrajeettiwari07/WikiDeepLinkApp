//
//  SearchHistoryCoordinator.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import UIKit

class SearchHistoryCoordinator: Coordinator {
	// MARK: - Properties -
	var navigationController: UINavigationController
	
	
	// MARK: - Lifecycle -
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	
	// MARK: - Builder -
	func start() {
		guard let viewController = SearchHistoryViewController.build() else { return }
		viewController.delegate =  self
		navigationController.setViewControllers([viewController], animated: false)
	}
}

extension SearchHistoryCoordinator: Routable {
	func openWikipediaApp(for url: URL) {
		UIApplication.shared.open(url, options: [:]) { _ in }
	}
}
