//
//  NetworkService.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

// Protocol to be used to fetch photo data
protocol NetworkServiceProtocol {
	func fetchData<T: Codable>(for endPoint: LocationAPI,
										to type: T.Type,
										completion: @escaping (_ moviList: T?, _ error: NetworkError?) -> ())
}

struct NetworkService: NetworkServiceProtocol, DataModelDecoder {
	// MARK: - Properties -
	private var networkManager: NetworkManagerProtocol
	
	// MARK: - Lifecycle -
	init(_ networkManager: NetworkManagerProtocol = NetworkManager()) {
		self.networkManager = networkManager
	}
	
	
	func fetchData<T: Codable>(for endPoint: LocationAPI,
										to type: T.Type,
										completion: @escaping (_ locationList: T?, _ error: NetworkError?) -> ()) {
		
		networkManager.fetchData(endPoint, completion: { data, error in
			guard let data = data else {
				completion(nil,NetworkError.requestError)
				return
			}
			
			guard let locationList =  self.decode(data: data, to: type) else {
				completion(nil, NetworkError.dataParseError)
				return
			}
			completion(locationList, nil)
		})
	}
}
