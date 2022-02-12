//
//  SearchInteractor.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol SearchInteractorProtocol {
	func getLocations()
	func validate(_ place: String)
}

class SearchInteractor {
	// MARK: - Properties -
	private let presenter: SearchPresenterProtocol
	private let worker: SearchWorkerProtocol
	private let urlProviderWorker: URLProviderServiceProtocol
	private let dataHandler: DataManagerProtocol
	
	
	// MARK: - Init -
	init(
		presenter: SearchPresenterProtocol,
		worker: SearchWorkerProtocol,
		urlProviderWorker: URLProviderServiceProtocol = URLProviderWorker(),
		dataHandler: DataManagerProtocol = DataHandler()
	) {
		self.presenter = presenter
		self.worker = worker
		self.urlProviderWorker = urlProviderWorker
		self.dataHandler = dataHandler
	}
}

extension SearchInteractor: SearchInteractorProtocol {
	func getLocations() {
		guard Reachability.isConnectedToNetwork() else {
			self.presenter.presentError(with: NetworkError.internetError.errorDescription)
			return
		}
		worker.getLocationsList(for: LocationAPI.locations, to: LocationModel.self, completion: { [weak self] result in
			guard let self = self else {return}
			switch result {
			case .success(let locations):
				self.presenter.presentLocations(locations)
			case .failure(let error):
				self.presenter.presentError(with: error.errorDescription)
			}
		})
	}
	
	func validate(_ place: String) {
		save(place)
		urlProviderWorker.getDetails(for: place, completion: { [weak self] result in
				guard let self = self else {return}
				switch result {
				case .success(let url):
					self.presenter.presentURL(url)
				case .failure(let error):
					self.presenter.presentError(with: error.message)
				}
		})
	}
	
	func save(_ place: String) {
		var savedData = dataHandler.getData(from: FileName.forHistory, to: [Places].self)
		if savedData == nil {
			savedData = [Places]()
		}
		savedData?.append(Places(name: place))
		_ = dataHandler.save(data: savedData, fileName: FileName.forHistory)
	}
}
