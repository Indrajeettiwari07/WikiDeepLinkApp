//
//  SearchHistoryPresenterTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchHistoryPresenterTest: XCTestCase {
	var sut: SearchHistoryPresenter!
	let viewController = MockSearchHistoryView()

	 override func setUpWithError() throws {
        sut = SearchHistoryPresenter()
		 sut.viewController = viewController
    }
	
	func testPresentSearchedText() {
		sut.presentSearchedText([Places(name: "Amsterdam")])
		XCTAssertEqual(viewController.searchedList, true)
	}
	
	func testPresentError() {
		sut.presentError(with: "")
		XCTAssertEqual(viewController.showError, true)
	}
	
	func testPresentURL() {
		sut.presentURL(URL(string: "https://google.com")!)
		XCTAssertEqual(viewController.showURL, true)
	}
   
}
