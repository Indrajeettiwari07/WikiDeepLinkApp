//
//  Wikipedia_URLProviderTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class Wikipedia_URLProviderTest: XCTestCase {
	var sut: Wikipedia_URLProvider!

    override func setUpWithError() throws {
        sut = Wikipedia_URLProvider(baseURLString: "wikipedia://", host: "places")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
	
	func testURLWithQueryItem() {
		let url = sut.urlWithQueryItem(forValue: "testValue", key: "testKey")
		XCTAssertNotNil(url)
		XCTAssertEqual(url, URL(string: "wikipedia://places?testKey=testValue")!)
	}
	
	func testCanOpen() {
		let canOpen = sut.canOpen(URL(string: "wikipedia://places?testKey=testValue")!)
		XCTAssertFalse(canOpen)
	}
}
