//
//  SearchHistoryInteractor.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol SearchHistoryInteractorProtocol {
	func getSearchHistory()
	func validate(_ place: String)
}

class SearchHistoryInteractor {
	// MARK: - Properties -
	private let presenter: SearchHistoryPresenterProtocol
	private let urlProviderService: URLProviderServiceProtocol
	private let dataHandler: DataManagerProtocol
	
	// MARK: - Init -
	init(
		presenter: SearchHistoryPresenterProtocol,
		urlProviderService: URLProviderServiceProtocol = URLProviderWorker(),
		dataHandler: DataManagerProtocol = DataHandler()
	) {
		self.presenter = presenter
		self.urlProviderService = urlProviderService
		self.dataHandler = dataHandler
	}
}

extension SearchHistoryInteractor: SearchHistoryInteractorProtocol {
	func getSearchHistory() {
		guard let savedData = dataHandler.getData(from: FileName.forHistory, to: [Places].self) else { return }
		presenter.presentSearchedText(savedData)
	}
	
	func validate(_ place: String) {
		urlProviderService.getDetails(for: place, completion: { [weak self] result in
				guard let self = self else {return}
				switch result {
				case .success(let url):
					self.presenter.presentURL(url)
				case .failure(let error):
					self.presenter.presentError(with: error.message)
				}
		})
	}
}
