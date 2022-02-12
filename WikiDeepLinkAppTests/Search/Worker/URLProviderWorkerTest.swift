//
//  URLProviderWorkerTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 12/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class URLProviderWorkerTest: XCTestCase {
	var sut: URLProviderWorker!
	let urlProvider = MockURLProvider()
	
    override func setUpWithError() throws {
        sut = URLProviderWorker(urlProvider: urlProvider)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
	
	func testGetDetails() {
		urlProvider.shouldOpen = true
		let fetchLocationURLExpectation = expectation(description: "Data is received Successfully")
		sut.getDetails(for: "Amsterdam", completion: { result in
			fetchLocationURLExpectation.fulfill()
			switch result {
			case .success(let url):
				XCTAssertNotNil(url)
				XCTAssertEqual(URL(string: "https://google.com"), url)
			case .failure:
				return
			}
		})
		
		wait(for: [fetchLocationURLExpectation], timeout: 1.0)
	}
	
	func testGetDetailsFailure() {
		urlProvider.shouldOpen = false
		let fetchLocationURLFailureExpectation = expectation(description: "Data is received Successfully")
		sut.getDetails(for: "Amsterdam", completion: { result in
			fetchLocationURLFailureExpectation.fulfill()
			switch result {
			case .success:
				return
			case .failure(let error):
				XCTAssertNotNil(error)
			}
		})
		
		wait(for: [fetchLocationURLFailureExpectation], timeout: 1.0)
	}

}
