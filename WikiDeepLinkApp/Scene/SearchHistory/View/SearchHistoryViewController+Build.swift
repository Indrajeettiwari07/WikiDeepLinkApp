//
//  SearchHistoryViewController+Build.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

extension SearchHistoryViewController {
	static func build() -> SearchHistoryViewController? {
		let presenter = SearchHistoryPresenter()
		let interactor = SearchHistoryInteractor(presenter: presenter)
		guard let viewController = Screen.SearchHistory.viewController as? SearchHistoryViewController else {
			return nil
		}
		presenter.viewController = viewController
		viewController.interactor = interactor
		return viewController
	}
}
