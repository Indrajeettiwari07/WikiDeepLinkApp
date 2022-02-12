//
//  SearchHistoryPresenter.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol SearchHistoryPresenterProtocol {
	func presentSearchedText(_ searchedPlaces: [Places])
	func presentError(with message: String)
	func presentURL(_ url: URL)
}

class SearchHistoryPresenter {
	// MARK: - Properties -
	weak var viewController: SearchHistoryViewProtocol?
}

extension SearchHistoryPresenter: SearchHistoryPresenterProtocol {
	func presentSearchedText(_ searchedPlaces: [Places]) {
		let searchedList = searchedPlaces.map { $0.name }
		viewController?.showSearchedList(searchedList.reversed())
	}
	
	func presentError(with message: String) {
		viewController?.showError(with: message)
	}
	
	func presentURL(_ url: URL) {
		viewController?.showURL(with: url)
	}
}
