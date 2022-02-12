//
//  SearchInteractorTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchInteractorTest: XCTestCase {
	
	var sut: SearchInteractor!
	let presenter = MockSearchPresenter()
	let worker = MockSearchWorker()
	let urlProviderWorker = MockURLProviderService()
	let dataHandler = MockDataHandler()

    override func setUpWithError() throws {
        sut = SearchInteractor(presenter: presenter,
							   worker: worker,
							   urlProviderWorker: urlProviderWorker,
							   dataHandler: dataHandler)
    }

    override func tearDownWithError() throws {
		sut = nil
    }
	
	func testGetLocations() {
		sut.getLocations()
		let expectationToFetchLocations = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToFetchLocations], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(presenter.locationsReceived, true)
		}
	}
	
	func testGetLocationFailure() {
		worker.showError = true
		sut.getLocations()
		let expectationToFetchLocationsFailure = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToFetchLocationsFailure], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(presenter.presentError, true)
		}
	}
	
	func testValidateSuccess() {
		sut.validate("")
		let expectationToValidate = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToValidate], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(presenter.urlReceived, true)
		}
	}
	
	func testValidateFailure() {
		urlProviderWorker.showError = true
		sut.validate("")
		let expectationToValidateFailure = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToValidateFailure], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(presenter.presentError, true)
		}
	}
	
	func testSaveData() {
		sut.validate("")
		let expectationToSaveSuccessfully = expectation(description: "Test after 1.0 second wait")
		let result = XCTWaiter.wait(for: [expectationToSaveSuccessfully], timeout: 1.0)
		if result == XCTWaiter.Result.timedOut {
			XCTAssertEqual(dataHandler.dataSaved, true)
		}
	}
}
