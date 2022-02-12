//
//  SearchWorker.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol SearchWorkerProtocol {
	func getLocationsList<T: Codable>(for api: LocationAPI, to type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

class SearchWorker {
	// MARK: - Properties -
	private var networkService: NetworkServiceProtocol
	
	init(networkService: NetworkServiceProtocol = NetworkService()) {
		self.networkService = networkService
	}
}

extension SearchWorker: SearchWorkerProtocol {
	func getLocationsList<T>(for api: LocationAPI, to type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
		networkService.fetchData(for: api, to: type, completion: { data, error in
			
			guard let error = error else {
				guard let data = data else {
					completion(.failure(.noDataFound))
					return
				}
				
				completion(.success(data))
				return
			}
			
			completion(.failure(error))
			
		})
	}
	
}
