//
//  SearchViewController+Build.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation
import UIKit

extension SearchViewController {
	static func build() -> SearchViewController? {
		guard let viewController = Screen.Search.viewController as? SearchViewController else { return nil }
		let presenter = SearchPresenter()
		let worker = SearchWorker()
		presenter.viewController = viewController
		viewController.interactor = SearchInteractor(presenter: presenter,
														worker: worker)
		return viewController
	}
}
