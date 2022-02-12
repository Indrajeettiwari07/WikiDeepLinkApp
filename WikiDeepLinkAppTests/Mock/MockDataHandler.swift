//
//  MockDataHandler.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class MockDataHandler: DataManagerProtocol {
	var dataSaved = false
	var dataDeleted = false
	
	func save<T>(data: T?, fileName: String) -> Bool where T : Decodable, T : Encodable {
		dataSaved = true
		return true
	}
	
	func getData<T>(from fileName: String, to type: T.Type) -> T? where T : Decodable, T : Encodable {
		var mockData: [String: Any] = [:]
		if type == LocationModel.self {
			mockData = ["locations": [["name": "testLocation",
												   "lat": 1.0,
												"long": 1.0]]]
		}
		else {
			mockData = ["name": "Amsterdam"]
		}
		let jsonData = try! JSONSerialization.data(withJSONObject: [mockData], options: .prettyPrinted)
		let mockLocationList = try! JSONDecoder().decode(type, from: jsonData)
		return mockLocationList
	}
	
	func deleteAll(from fileName: String) {
		dataDeleted = true
	}
	
	
}
