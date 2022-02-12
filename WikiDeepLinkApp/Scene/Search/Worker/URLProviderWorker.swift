//
//  URLProviderService.swift
//  WikiDeepLinkApp
//
//  Created by Inder Tiwari on 09/02/2022.
//

import Foundation

protocol URLProviderServiceProtocol {
	func getDetails(for place: String, completion: @escaping (Result<URL, ErrorHandler>) -> Void)
}

class URLProviderWorker: URLProviderServiceProtocol {
	
	// MARK: - Properties -
	private let urlProvider: URLProvider
	
	enum PlaceSearchKey: String {
		case name = "WMFPlaceSearchByName"
		case location = "WNFPlaceSearchByLocation"
	}
	
	init(urlProvider: URLProvider = Wikipedia_URLProvider(baseURLString: "wikipedia://", host: "places")) {
		self.urlProvider = urlProvider
	}
	
	func getDetails(for place: String, completion: @escaping (Result<URL, ErrorHandler>) -> Void) {
		guard place.count >= 2 else {
			completion(.failure(.invalidSearch))
			return
		}
		
		let searchKey = place.isLocation ? PlaceSearchKey.location : .name
		let deepLinkURL = urlProvider.urlWithQueryItem(forValue: place, key: searchKey.rawValue)
		
		guard let url = deepLinkURL else {
			completion(.failure(.invalidUrl))
			return
		}
		
		guard urlProvider.canOpen(url) else {
			completion(.failure(.redirectFailure))
			return
		}
		
		completion(.success(url))
		
	}
}
