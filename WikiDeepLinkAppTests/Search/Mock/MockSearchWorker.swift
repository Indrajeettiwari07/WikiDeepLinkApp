//
//  MockSearchWorker.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockSearchWorker: SearchWorkerProtocol {
	var showError: Bool =  false
	func getLocationsList<T>(for api: LocationAPI, to type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, T : Encodable {
		guard showError else {
			let locationModel = LocationModel(locations: [LocationModel.PlaceData(name: "",
																				  lat: 1.0,
																				  long: 1.0)])
			completion(.success(locationModel as! T))
			return
		}
		
		completion(.failure(.invalidPath))
	}
}
