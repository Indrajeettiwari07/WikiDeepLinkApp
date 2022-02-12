//
//  DataHandlerTest.swift
//  WikiDeepLinkAppTests
//
//  Created by Inder Tiwari on 11/02/2022.
//

import XCTest
@testable import WikiDeepLinkApp

class DataHandlerTest: XCTestCase {
	
	var sut: DataHandler!

    override func setUpWithError() throws {
       sut = DataHandler()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
	
	func testSaveAndGetData() {
		let dataToBeSaved = Places(name: "testData")
		_ = sut.save(data: dataToBeSaved, fileName: "testFile")
		let dataRetrieved = sut.getData(from: "testFile", to: Places.self)
		XCTAssertNotNil(dataRetrieved)
		XCTAssertEqual(dataToBeSaved.name, dataRetrieved?.name)
	}
	
	func testDeleteAll() {
		let dataToBeSaved = Places(name: "testData")
		_ = sut.save(data: dataToBeSaved, fileName: "testFile")
		sut.deleteAll(from: "testFile")
		let dataRetrieved = sut.getData(from: "testFile", to: Places.self)
		XCTAssertNil(dataRetrieved)
		
	}
}
