//
//  SearchPresenterTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 10/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class SearchPresenterTest: XCTestCase {
	
	var sut: SearchPresenter!
	let viewController = MockSearchViewController()

    override func setUpWithError() throws {
        sut = SearchPresenter()
		sut.viewController = viewController
    }

    override func tearDownWithError() throws {
		sut = nil
    }
	
	func testPresentLocations() {
		sut.presentLocations(LocationModel(locations: [LocationModel.PlaceData(name: "",
																			   lat: 1.0,
																			   long: 1.0)]))
		XCTAssertEqual(viewController.showLocations, true)
	}
	
	func testPresentURL() {
		sut.presentURL(URL(string: "https://google.com")!)
		XCTAssertEqual(viewController.showURL, true)
	}
	
	func testPresentError() {
		sut.presentError(with: "There seems to be some error")
		XCTAssertEqual(viewController.showError, true)
	}
}
