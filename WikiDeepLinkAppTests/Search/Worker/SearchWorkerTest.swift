//
//  SearchWorkerTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchWorkerTest: XCTestCase {
	var sut: SearchWorker!
	
    override func setUpWithError() throws {
		sut = SearchWorker(networkService: MockNetworkService(false))
    }

    override func tearDownWithError() throws {
        sut = nil
    }
	
	func testGetLocationListSuccess() {
		let fetchLocationListExpectation = expectation(description: "Data is received Successfully")
		sut.getLocationsList(for: LocationAPI.locations, to: LocationModel.self, completion: { result in
			fetchLocationListExpectation.fulfill()
			switch result {
			case .success(let list):
				XCTAssertEqual(list.locations.count, 1)
				XCTAssertEqual(list.locations.first?.name, "testLocation")
				XCTAssertEqual(list.locations.first?.lat, 1.0)
				XCTAssertEqual(list.locations.first?.long, 1.0)
			case .failure:
				return
			}
		})
		
		wait(for: [fetchLocationListExpectation], timeout: 1.0)
	}
	
	func testGetLocationListFailure() {
		sut =  SearchWorker(networkService: MockNetworkService(true))
		let fetchLocationListExpectation = expectation(description: "Network Error")
		sut.getLocationsList(for: LocationAPI.locations, to: LocationModel.self, completion: { result in
			fetchLocationListExpectation.fulfill()
			switch result {
			case .success:
				return
			case .failure(let message):
				XCTAssertNotNil(message)
				XCTAssertEqual(message.errorDescription, "There seems to be some error, please try after some time.")
			}
		})
		
		wait(for: [fetchLocationListExpectation], timeout: 1.0)
	}

}
