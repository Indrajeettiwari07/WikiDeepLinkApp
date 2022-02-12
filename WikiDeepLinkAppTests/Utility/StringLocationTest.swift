//
//  StringLocationTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class StringLocationTest: XCTestCase {

	func testIsLocation() {
		let testString = "12.09789,15.757587"
		XCTAssertEqual(testString.isLocation, true)
		
		let testInvalidString = "checkfailstate, 15.757587"
		XCTAssertEqual(testInvalidString.isLocation, false)
	}

}
