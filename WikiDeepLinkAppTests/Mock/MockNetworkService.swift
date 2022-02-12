//
//  MockNetworkService.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockNetworkService {
	
	private var showError: Bool
	let mockLocationData = ["locations": [["name": "testLocation",
										   "lat": 1.0,
										   "long": 1.0]]]
	
	init(_ showError: Bool) {
		self.showError = showError
	}
}

extension MockNetworkService: NetworkServiceProtocol {
	func fetchData<T>(for endPoint: LocationAPI, to type: T.Type, completion: @escaping (T?, NetworkError?) -> ()) where T : Decodable, T : Encodable {
		guard showError else {
			let jsonData = try! JSONSerialization.data(withJSONObject: mockLocationData, options: .prettyPrinted)
			let mockLocationList = try! JSONDecoder().decode(LocationModel.self, from: jsonData)
			completion(mockLocationList as? T, nil)
			
			return
		}
		
		completion(nil, .requestError)
	}
}
