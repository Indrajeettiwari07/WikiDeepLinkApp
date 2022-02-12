//
//  NetworkServiceTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class NetworkServiceTest: XCTestCase {
	var sut: NetworkServiceProtocol!

	override func setUpWithError() throws {
	   sut = MockNetworkService(false)
	}

	override func tearDownWithError() throws {
		sut = nil
	}
	
	func testFetchLocations() {
		let fetchLocationListExpectation = expectation(description: "Data is received Successfully")
		sut.fetchData(for: LocationAPI.locations, to: LocationModel.self, completion: { locationList, error in
			fetchLocationListExpectation.fulfill()
			XCTAssertNil(error)
			XCTAssertEqual(locationList?.locations.count, 1)
			XCTAssertEqual(locationList?.locations.first?.name, "testLocation")
			XCTAssertEqual(locationList?.locations.first?.lat, 1.0)
			XCTAssertEqual(locationList?.locations.first?.long, 1.0)
		})
		
		wait(for: [fetchLocationListExpectation], timeout: 1.0)
	}
	
	func testFetchLocationError() {
		sut = MockNetworkService(true)
		let fetchLocationListExpectationFailure = expectation(description: "Data is received Successfully")
		sut.fetchData(for: LocationAPI.locations, to: LocationModel.self, completion: { locationList, error in
			fetchLocationListExpectationFailure.fulfill()
			XCTAssertNotNil(error)
		})
		
		wait(for: [fetchLocationListExpectationFailure], timeout: 1.0)
	}
}
