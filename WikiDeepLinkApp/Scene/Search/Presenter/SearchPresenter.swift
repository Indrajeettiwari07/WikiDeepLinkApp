//
//  SearchPresenter.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol SearchPresenterProtocol {
	func presentLocations(_ locations: LocationModel)
	func presentURL(_ url: URL)
	func presentError(with message: String)
}

class SearchPresenter {
	// MARK: - Properties -
	weak var viewController: SearchViewProtocol?
	private var searchViewModelList: [SearchViewModel] = []
}

extension SearchPresenter: SearchPresenterProtocol {
	func presentLocations(_ locations: LocationModel) {
		for placeData in locations.locations {
			let viewModel = SearchViewModel(placeData)
			searchViewModelList.append(viewModel)
		}
		
		viewController?.showLocations(with: searchViewModelList)
	}
	
	func presentURL(_ url: URL) {
		viewController?.showURL(with: url)
	}
	
	func presentError(with message: String) {
		viewController?.showError(with: message)
	}
}
