//
//  SearchHistoryInteractorTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchHistoryInteractorTest: XCTestCase {
	var sut: SearchHistoryInteractor!
	let urlProviderService = MockURLProviderService()
	let dataHandler = MockDataHandler()
	let presenter = MockSearcHistoryPresenter()

    override func setUpWithError() throws {
        sut = SearchHistoryInteractor(presenter: presenter,
									  urlProviderService: urlProviderService,
									  dataHandler: dataHandler)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
	
	func testGetHistory() {
		sut.getSearchHistory()
		XCTAssertEqual(presenter.presentSearchedText, true)
	}
	
	func testValidation() {
		sut.validate("Amsterdam")
		XCTAssertEqual(presenter.presentURL, true)
	}
	
	func testValidationError() {
		urlProviderService.showError = true
		sut.validate("Amsterdam")
		XCTAssertEqual(presenter.presentError, true)
	}
}
